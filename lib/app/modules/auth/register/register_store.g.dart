// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterStoreBase, Store {
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: 'RegisterStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validPasswordComputed;

  @override
  bool get validPassword =>
      (_$validPasswordComputed ??= Computed<bool>(() => super.validPassword,
              name: 'RegisterStoreBase.validPassword'))
          .value;
  Computed<bool>? _$validconfirmPasswordComputed;

  @override
  bool get validconfirmPassword => (_$validconfirmPasswordComputed ??=
          Computed<bool>(() => super.validconfirmPassword,
              name: 'RegisterStoreBase.validconfirmPassword'))
      .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: 'RegisterStoreBase.validForm'))
          .value;
  Computed<bool>? _$validCodeComputed;

  @override
  bool get validCode =>
      (_$validCodeComputed ??= Computed<bool>(() => super.validCode,
              name: 'RegisterStoreBase.validCode'))
          .value;

  late final _$userAtom =
      Atom(name: 'RegisterStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$authModelAtom =
      Atom(name: 'RegisterStoreBase.authModel', context: context);

  @override
  AuthModel? get authModel {
    _$authModelAtom.reportRead();
    return super.authModel;
  }

  @override
  set authModel(AuthModel? value) {
    _$authModelAtom.reportWrite(value, super.authModel, () {
      super.authModel = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'RegisterStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'RegisterStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'RegisterStoreBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'RegisterStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'RegisterStoreBase.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$passwordVisibilityAtom =
      Atom(name: 'RegisterStoreBase.passwordVisibility', context: context);

  @override
  bool get passwordVisibility {
    _$passwordVisibilityAtom.reportRead();
    return super.passwordVisibility;
  }

  @override
  set passwordVisibility(bool value) {
    _$passwordVisibilityAtom.reportWrite(value, super.passwordVisibility, () {
      super.passwordVisibility = value;
    });
  }

  late final _$confirmPasswordVisibilityAtom = Atom(
      name: 'RegisterStoreBase.confirmPasswordVisibility', context: context);

  @override
  bool get confirmPasswordVisibility {
    _$confirmPasswordVisibilityAtom.reportRead();
    return super.confirmPasswordVisibility;
  }

  @override
  set confirmPasswordVisibility(bool value) {
    _$confirmPasswordVisibilityAtom
        .reportWrite(value, super.confirmPasswordVisibility, () {
      super.confirmPasswordVisibility = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'RegisterStoreBase.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$counterAtom =
      Atom(name: 'RegisterStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$photoAtom =
      Atom(name: 'RegisterStoreBase.photo', context: context);

  @override
  XFile? get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(XFile? value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  late final _$photoCropAtom =
      Atom(name: 'RegisterStoreBase.photoCrop', context: context);

  @override
  File? get photoCrop {
    _$photoCropAtom.reportRead();
    return super.photoCrop;
  }

  @override
  set photoCrop(File? value) {
    _$photoCropAtom.reportWrite(value, super.photoCrop, () {
      super.photoCrop = value;
    });
  }

  late final _$logoutAsyncAction =
      AsyncAction('RegisterStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getAuthModelAsyncAction =
      AsyncAction('RegisterStoreBase.getAuthModel', context: context);

  @override
  Future<void> getAuthModel() {
    return _$getAuthModelAsyncAction.run(() => super.getAuthModel());
  }

  late final _$registerAsyncAction =
      AsyncAction('RegisterStoreBase.register', context: context);

  @override
  Future<BaseModel<AuthModel>> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$resendSMSAsyncAction =
      AsyncAction('RegisterStoreBase.resendSMS', context: context);

  @override
  Future<BaseModel<StringResponseModel>> resendSMS() {
    return _$resendSMSAsyncAction.run(() => super.resendSMS());
  }

  late final _$validateCodeAsyncAction =
      AsyncAction('RegisterStoreBase.validateCode', context: context);

  @override
  Future<BaseModel<AuthModel>> validateCode() {
    return _$validateCodeAsyncAction.run(() => super.validateCode());
  }

  late final _$RegisterStoreBaseActionController =
      ActionController(name: 'RegisterStoreBase', context: context);

  @override
  void setAuthModel(AuthModel model) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setAuthModel');
    try {
      return super.setAuthModel(model);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setpasswordVisibility() {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setpasswordVisibility');
    try {
      return super.setpasswordVisibility();
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPasswordVisibility() {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setConfirmPasswordVisibility');
    try {
      return super.setConfirmPasswordVisibility();
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCounter(int value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setCounter');
    try {
      return super.setCounter(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoto(XFile? xFile) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setPhoto');
    try {
      return super.setPhoto(xFile);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhotoCrop(File? file) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setPhotoCrop');
    try {
      return super.setPhotoCrop(file);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
authModel: ${authModel},
name: ${name},
email: ${email},
phone: ${phone},
password: ${password},
confirmPassword: ${confirmPassword},
passwordVisibility: ${passwordVisibility},
confirmPasswordVisibility: ${confirmPasswordVisibility},
code: ${code},
counter: ${counter},
photo: ${photo},
photoCrop: ${photoCrop},
validEmail: ${validEmail},
validPassword: ${validPassword},
validconfirmPassword: ${validconfirmPassword},
validForm: ${validForm},
validCode: ${validCode}
    ''';
  }
}
