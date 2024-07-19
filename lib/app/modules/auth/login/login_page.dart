import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/widgets/create_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/auth/login/login_store.dart';
import 'package:laserfast_app/app/modules/auth/widgets/password_input_widget.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'Login'});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
      body: Container(
        decoration: const BoxDecoration(
          color: primary,
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  primary,
                ],
                stops: [0.01, 0.35],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(),
                DividerWidget(height: 2.h),
                _form(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWidget(widget.title, style: categoryTitle(color: white)),
              ],
            ),
          ),
        ),
        //precisa existir pra alinhar o título no centro
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.transparent,
          ),
          onPressed: () {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          color: Colors.transparent,
        ),
      ],
    );
  }

  Widget _form() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Column(
        children: [
          Observer(builder: (_) {
            return InputWidget(
              text: 'E-mail',
              onChanged: _store.setEmail,
              keyboardType: TextInputType.emailAddress,
              error: !_store.validEmail ? "E-mail inválido" : null,
            );
          }),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return PasswordInputWidget(
              onChanged: _store.setPassword,
              passwordVisibility: _store.passwordVisibility,
              onTap: () => _store.setpasswordVisibility(),
            );
          }),
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
              textColor: primaryDark,
              disabled: !_store.validForm,
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
