import 'package:laserfast_app/app/shared/validators.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/app/apis/auth.api.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:laserfast_app/loading_store.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = Modular.get<LoadingStore>();

  //OBSERVABLE
  @observable
  AuthModel? authModel;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool passwordVisibility = false;

  // COMPUTED
  @computed
  bool get validEmail => (email != null) ? validateEmail(email ?? "") : true;

  @computed
  bool get validForm => validEmail && notEmpty(password);

  bool notEmpty(String? value) {
    return value != "" && value != null;
  }

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;
  @action
  void setEmail(String? value) => email = value;
  @action
  void setPassword(String? value) => password = value;
  @action
  void setpasswordVisibility() => passwordVisibility = !passwordVisibility;

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

  @action
  Future<BaseModel<AuthModel>> login() async {
    loadingStore.show();
    BaseModel<AuthModel> r = BaseModel<AuthModel>();
    if (validForm) {
      r = await authApi.login(email!, password!);
    }
    loadingStore.hide();
    return r;
  }

  //MISCS
}
