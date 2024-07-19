import 'package:laserfast_app/app/models/hives/app_presentation.hive.dart';
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
  final AppPresentationHive _appPresentationHive = AppPresentationHive();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //OBSERVABLE
  @observable
  AuthModel? authModel;

  @observable
  String? email;

  @observable
  String? password;

  // COMPUTED

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;
  @action
  void setEmail(String? value) => email = value;
  @action
  void setPassword(String? value) => password = value;

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
    r = await authApi.login(email!, password!);
    loadingStore.hide();

    if (r.status) _appPresentationHive.setHasSeenAppPresentationBefore(true);

    return r;
  }

  //MISCS
}
