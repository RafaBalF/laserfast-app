import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/mixins/form_validations_mixin.dart';
import 'package:laserfast_app/app/modules/auth/recover_password/recover_password_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecoverPasswordPage extends StatefulWidget {
  final String title;
  const RecoverPasswordPage({super.key, this.title = 'REDEFINIR SENHA'});
  @override
  RecoverPasswordPageState createState() => RecoverPasswordPageState();
}

class RecoverPasswordPageState extends State<RecoverPasswordPage>
    with FormValidationsMixin {
  final RecoverPasswordStore _store = Modular.get<RecoverPasswordStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();

    super.dispose();
  }

  void _clearFields() {
    _store.setEmail(null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: widget.title,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DividerWidget(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: textWidget(
                  'Escreva seu email cadastrado e redefina sua senha',
                  style: h2(),
                  textAlign: TextAlign.center,
                ),
              ),
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
      child: Column(
        children: [
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
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'ENTRAR',
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                if (!mounted) return;

                showSuccessBottomSheet(
                  context,
                  message: 'E-MAIL ENVIADO COM SUCESSO',
                  details: 'Acesse sua caixa de email e redefina sua senha',
                  btnTitle: 'VOLTAR PARA LOGIN',
                  onPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                );
              },
              loading: _store.loadingStore.isLoading,
              backgroundColor: accent,
              textColor: white,
            );
          }),
        ],
      ),
    );
  }
}
