import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/auth/auth_store.dart';
import 'package:laserfast_app/app/shared/widgets/custom_future_builder_widget.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({super.key, this.title = 'AuthPage'});
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore _store = Modular.get<AuthStore>();
  late final Future _myFuture;
  @override
  void initState() {
    super.initState();
    _myFuture = _store.getAuthModel();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilderWidget(
      future: _myFuture,
      finalWidget: _mainBody(),
      loadingWidget: _loadingBody(),
    );
  }

  Widget _mainBody() {
    if (_store.authModel != null) {
      Modular.to.navigate('/home/');
    } else {
      Modular.to.navigate('/auth/login');
    }
    return _loadingBody();
  }

  Widget _loadingBody() {
    return Image.asset(
      'assets/images/spash_screen.png',
      fit: BoxFit.cover,
    );
  }
}
