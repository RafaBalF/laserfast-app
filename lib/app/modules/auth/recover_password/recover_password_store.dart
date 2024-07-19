import 'package:laserfast_app/app/apis/user.api.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/app/apis/auth.api.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/string_response.model.dart';
import 'package:laserfast_app/loading_store.dart';

part 'recover_password_store.g.dart';

class RecoverPasswordStore = RecoverPasswordStoreBase
    with _$RecoverPasswordStore;

abstract class RecoverPasswordStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final UserApi userApi = UserApi();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //CONSTS

  //VARIABLES

  //OBSERVABLE

  @observable
  String? email;

  // COMPUTED

  //ACTION
  @action
  void setEmail(String? value) => email = value;

  @action
  Future<BaseModel<StringResponseModel>> recoverPassword() async {
    var result = await authApi.forgetPassword(email);

    return result;
  }

  //MISCS
}
