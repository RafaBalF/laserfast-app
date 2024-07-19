import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:compregados_app_v2/app/apis/auth.api.dart';
import 'package:compregados_app_v2/app/models/auth.model.dart';
import 'package:compregados_app_v2/app/models/hives/login.hive.dart';
import 'package:compregados_app_v2/loading_store.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = Modular.get<LoadingStore>();

  //OBSERVABLE

  @observable
  AuthModel? authModel;

  // COMPUTED

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;

  @action
  Future logout() async {
    await _loginHive.logout();
    getAuthModel();
  }

  @action
  Future<void> getAuthModel() async {
    if (_loginHive.isLogged()) {
      authModel = _loginHive.getLogin();
    } else {
      authModel = null;
    }
  }

  //MISCS
}
