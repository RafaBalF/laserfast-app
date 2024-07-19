import 'package:laserfast_app/app/mixins/form_validations_mixin.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/widgets/create_account_widget.dart';
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
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'Login'});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with FormValidationsMixin {
  final LoginStore _store = Modular.get<LoginStore>();

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
    _store.setEmail(null);
    _store.setPassword(null);
  }

  @override
  Widget build(BuildContext context) {
    if (_store.authModel != null) {
      Modular.to.navigate('/home/initial');
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: const BoxDecoration(color: primary),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/laserfast-logo.png',
                  height: 25.h,
                ),
                DividerWidget(height: 2.h),
                _form(),
              ],
            ),
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
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            onChanged: _store.setPassword,
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
              onTap: () {},
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
                  Modular.to.navigate('/home/initial');
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
          const CreateAccountWidget(textColor: white),
        ],
      ),
    );
  }
}
