import 'dart:io';

import 'package:compregados_app_v2/app/apis/user.api.dart';
import 'package:compregados_app_v2/app/shared/validators.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:compregados_app_v2/app/apis/auth.api.dart';
import 'package:compregados_app_v2/app/models/auth.model.dart';
import 'package:compregados_app_v2/app/models/base.model.dart';
import 'package:compregados_app_v2/app/models/hives/login.hive.dart';
import 'package:compregados_app_v2/app/models/string_response.model.dart';
import 'package:compregados_app_v2/app/models/user.model.dart';
import 'package:compregados_app_v2/loading_store.dart';
import 'package:image_picker/image_picker.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final UserApi userApi = UserApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = Modular.get<LoadingStore>();

  //CONSTS
  final int minPasswordLength = 6;

  final int defaultCounterValue = 60;

  //VARIABLES
  String? _userUuid;

  //OBSERVABLE
  @observable
  UserModel? user;

  @observable
  AuthModel? authModel;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  bool passwordVisibility = false;

  @observable
  bool confirmPasswordVisibility = false;

  @observable
  String? code;

  @observable
  int counter = 60;

  @observable
  XFile? photo;

  @observable
  File? photoCrop;

  // COMPUTED
  @computed
  bool get validEmail => (email != null) ? validateEmail(email ?? "") : true;

  @computed
  bool get validPassword =>
      (password != null) ? password!.length >= minPasswordLength : true;

  @computed
  bool get validconfirmPassword => confirmPassword == password;

  @computed
  bool get validForm =>
      notEmpty(name) &&
      notEmpty(password) &&
      notEmpty(phone) &&
      validEmail &&
      validconfirmPassword;

  bool notEmpty(String? value) {
    return value != "" && value != null;
  }

  @computed
  bool get validCode => notEmpty(code) && code!.length == 6;

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;
  @action
  void setName(String? value) => name = value;
  @action
  void setEmail(String? value) => email = value;
  @action
  void setPhone(String? value) => phone = value;
  @action
  void setPassword(String? value) => password = value;
  @action
  void setConfirmPassword(String? value) => confirmPassword = value;
  @action
  void setpasswordVisibility() => passwordVisibility = !passwordVisibility;
  @action
  void setConfirmPasswordVisibility() =>
      confirmPasswordVisibility = !confirmPasswordVisibility;
  @action
  void setCode(String? value) => code = value;
  @action
  void setCounter(int value) => counter = value;

  @action
  void setPhoto(XFile? xFile) {
    if (xFile != null) {
      photo = xFile;
    }
  }

  @action
  void setPhotoCrop(File? file) {
    if (file != null) {
      photoCrop = file;
    }
  }

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
  Future<BaseModel<AuthModel>> register() async {
    loadingStore.show();

    user = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    var result = await userApi.create(user!, photo);

    if (result.status) {
      _userUuid = result.result!.uuid;
    }

    loadingStore.hide();

    return result;
  }

  @action
  Future<BaseModel<StringResponseModel>> resendSMS() async {
    if (_userUuid == null) {
      return BaseModel();
    }

    var result = await authApi.resendSMS(_userUuid!);

    setCounter(defaultCounterValue);

    return result;
  }

  @action
  Future<BaseModel<AuthModel>> validateCode() async {
    if (_userUuid == null) {
      return BaseModel();
    }

    loadingStore.show();

    var result = await authApi.confirmCode(_userUuid!, code!);

    if (result.status && result.result != null) {
      await _loginHive.setLogin(result.result!);
    }

    loadingStore.hide();

    return result;
  }

  //MISCS
}
