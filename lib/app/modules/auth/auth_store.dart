import 'package:laserfast_app/app/models/base.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/app/apis/auth.api.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:laserfast_app/loading_store.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //OBSERVABLE

  @observable
  AuthModel? authModel;
  @observable
  bool attemptedAutoLogin = false;
  @observable
  bool autoLogged = false;

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
    _loginHive.isLogged()
        ? authModel = _loginHive.getLogin()
        : authModel = null;
  }

  @action
  Future<void> attemptAutoLogin() async {
    await getAuthModel();

    if (authModel == null) {
      attemptedAutoLogin = true;
      return;
    }

    var r = BaseModel<AuthModel>();

    r = await authApi.validarLogin(authModel!.cpf!, authModel!.senha!);

    attemptedAutoLogin = true;

    if (!r.success) return;

    autoLogged = true;
  }

  //MISCS
}
