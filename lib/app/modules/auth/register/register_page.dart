import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:laserfast_app/app/mixins/form_validations_mixin.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/modules/auth/register/register_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({super.key, this.title = 'NOVA CONTA'});
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> with FormValidationsMixin {
  final RegisterStore _store = Modular.get<RegisterStore>();
  Timer? _verificationCodeTimeout;
  final int timeout = 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();
    if (_verificationCodeTimeout != null) {
      _verificationCodeTimeout!.cancel();
    }
    super.dispose();
  }

  void _clearFields() {
    _store.setName(null);
    _store.setEmail(null);
    _store.setPassword(null);
    _store.setConfirmPassword(null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: widget.title,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DividerWidget(height: 2.h),
              _form(),
              DividerWidget(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          children: [
            DividerWidget(height: 2.h),
            InputWidget(
              label: 'Nome completo',
              onChanged: _store.setName,
              validator: notEmpty,
            ),
            DividerWidget(height: 2.h),
            Observer(builder: (_) {
              return InputWidget(
                label: 'E-mail',
                onChanged: _store.setEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => combine([
                  () => notEmpty(v),
                  () => validEmail(v),
                ]),
              );
            }),
            DividerWidget(height: 2.h),
            PasswordInputWidget(
              onChanged: _store.setPassword,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
              ]),
            ),
            DividerWidget(height: 2.h),
            PasswordInputWidget(
              label: 'Confirmar senha',
              onChanged: _store.setConfirmPassword,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
                () => matchValue(v, _store.password, "Senhas não são iguais"),
              ]),
            ),
            DividerWidget(height: 5.h),
            SizedBox(
              width: 65.w,
              child: Observer(builder: (_) {
                return ButtonWidget.filled(
                  title: 'Cadastre-se',
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;

                    _store.setCode(null);

                    BaseModel b = await _store.register();

                    if (!mounted) return;

                    if (b.status) {
                      _startTimer();
                      showCustomBottomSheet(
                        context,
                        'CÓDIGO DE VERIFICAÇÃO',
                        _confirmPhoneSheet(),
                      );
                    } else {
                      showErrorBottomSheet(context, message: b.message);
                    }
                  },
                  loading: _store.loadingStore.isLoading,
                  backgroundColor: accent,
                  textColor: white,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _verificationCodeTimeout =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      _store.counter--;
      _store.setCounter(_store.counter);
      if (_store.counter == 0 && _verificationCodeTimeout != null) {
        _verificationCodeTimeout!.cancel();
      }
    });
  }

  Widget _confirmPhoneSheet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DividerWidget(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: textWidget(
            'Insira o código de verificação enviado para seu celular',
            textAlign: TextAlign.center,
            style: h2(),
          ),
        ),
        DividerWidget(height: 5.h),
        VerificationCode(
          textStyle: const TextStyle(fontSize: 20.0, color: black),
          keyboardType: TextInputType.number,
          underlineColor: primary,
          length: 6,
          cursorColor: primary,
          onCompleted: _store.setCode,
          onEditing: (bool value) {},
          fullBorder: true,
        ),
        DividerWidget(height: 3.h),
        Observer(builder: (_) {
          if (_store.counter == 0) {
            return GestureDetector(
              onTap: () async {
                await _store.resendSMS();
                _startTimer();
              },
              child: textWidget(
                'Reenviar Código',
                textAlign: TextAlign.center,
                style: text(textDecoration: TextDecoration.underline),
              ),
            );
          }
          return textWidget(
            'Reenviar em: ${_store.counter} segundos',
            textAlign: TextAlign.center,
            style: text(textDecoration: TextDecoration.underline),
          );
        }),
        DividerWidget(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'CONFIRMAR',
              onPressed: () async {
                var r = await _store.validateCode();

                if (mounted) {
                  if (r.status) {
                    Timer(const Duration(seconds: 2), () {
                      Modular.to.navigate('/home/initial');
                    });
                  }
                  showBaseModalBottomSheet(
                    context,
                    r,
                    onSuccessPressed: () {
                      Modular.to.navigate('/home/initial');
                    },
                  );
                }
              },
              disabled: !_store.validCode,
              backgroundColor: accent,
              textColor: primaryDark,
            );
          }),
        )
      ],
    );
  }
}
