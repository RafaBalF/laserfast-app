import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/mixins/form_validations_mixin.dart';
import 'package:laserfast_app/app/modules/profile/profile_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedefinirSenhaPage extends StatefulWidget {
  const RedefinirSenhaPage({super.key});
  @override
  RedefinirSenhaPageState createState() => RedefinirSenhaPageState();
}

class RedefinirSenhaPageState extends State<RedefinirSenhaPage>
    with FormValidationsMixin {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String password = '';
  String confirmPassword = '';

  @override
  void initState() {
    _future = Future.wait([_store.initRedefinirSenha()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'REDEFINIR SENHA',
            useDefaultPadding: false,
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _body();
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            children: [
              ShimmerWidget(width: 90.w, height: 6.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordInputWidget(
              label: 'Senha',
              onChanged: (s) => password = s,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
              ]),
            ),
            DividerWidget(height: 2.h),
            PasswordInputWidget(
              label: 'Confirmar senha',
              onChanged: (s) => confirmPassword = s,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
                () => matchValue(v, password, "Senhas não são iguais"),
              ]),
            ),
            DividerWidget(height: 5.h),
            ButtonWidget.filled(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;

                bool r = await _store.redefinirSenha(password, confirmPassword);

                if (r) Modular.to.pop();
              },
              backgroundColor: accent,
              title: 'SALVAR',
              textColor: white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.resetRedefinirSenha();

    super.dispose();
  }
}
