import 'package:laserfast_app/app/mixins/form_validations_mixin.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/auth/login/login_store.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with FormValidationsMixin {
  final LoginStore _store = Modular.get<LoginStore>();

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    _store.getAuthModel();
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();
    super.dispose();
  }

  void _clearFields() {
    _store.setCpf(null);
    _store.setSenha(null);
  }

  @override
  Widget build(BuildContext context) {
    if (_store.authModel != null) {
      Modular.to.navigate('/home/');
    }
    return SimpleScaffoldWidget(
        bodyColor: primary,
        showReturnArrow: false,
        bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DividerWidget(height: 15.h),
            Image.asset(
              'assets/icons/laserfast-logo.png',
              height: 10.h,
            ),
            DividerWidget(height: 10.h),
            _form(),
          ],
        ));
  }

  Widget _form() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Observer(builder: (_) {
            return InputWidget(
              label: 'Cpf',
              labelColor: white,
              keyboardType: TextInputType.number,
              inputFormatters: [cpfFormatter],
              onChanged: _store.setCpf,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            labelColor: white,
            onChanged: _store.setSenha,
            validator: notEmpty,
          ),
          DividerWidget(height: 1.h),
          Container(
            width: 100.w,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                'Esqueci minha senha',
                style: label(
                  textDecoration: TextDecoration.underline,
                  color: white,
                ),
              ),
              onTap: () {
                Modular.to.pushNamed('/auth/recover-password');
              },
            ),
          ),
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'ENTRAR',
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                var r = await _store.login();

                if (r.status) {
                  Modular.to.navigate('/home/');
                } else {
                  if (mounted) {
                    showErrorBottomSheet(context, message: r.message);
                  }
                }
              },
              backgroundColor: accent,
              textColor: white,
              loading: _store.loadingStore.isLoading,
            );
          }),
          DividerWidget(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ainda não tem uma conta? ',
                style: text(color: white),
              ),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/auth/register');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                    bottom: BorderSide(color: white),
                  )),
                  child: Text(
                    'Crie uma conta',
                    style: label(color: white),
                  ),
                ),
              )
            ],
          ),
          DividerWidget(height: 12.h),
        ],
      ),
    );
  }
}
