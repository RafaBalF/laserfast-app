// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$authModelAtom =
      Atom(name: 'AuthStoreBase.authModel', context: context);

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

  late final _$logoutAsyncAction =
      AsyncAction('AuthStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getAuthModelAsyncAction =
      AsyncAction('AuthStoreBase.getAuthModel', context: context);

  @override
  Future<void> getAuthModel() {
    return _$getAuthModelAsyncAction.run(() => super.getAuthModel());
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void setAuthModel(AuthModel model) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setAuthModel');
    try {
      return super.setAuthModel(model);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authModel: ${authModel}
    ''';
  }
}
