// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on ProfileStoreBase, Store {
  late final _$dadosPessoaisModelAtom =
      Atom(name: 'ProfileStoreBase.dadosPessoaisModel', context: context);

  @override
  DadosPessoaisModel? get dadosPessoaisModel {
    _$dadosPessoaisModelAtom.reportRead();
    return super.dadosPessoaisModel;
  }

  @override
  set dadosPessoaisModel(DadosPessoaisModel? value) {
    _$dadosPessoaisModelAtom.reportWrite(value, super.dadosPessoaisModel, () {
      super.dadosPessoaisModel = value;
    });
  }

  late final _$initProfileAsyncAction =
      AsyncAction('ProfileStoreBase.initProfile', context: context);

  @override
  Future<void> initProfile() {
    return _$initProfileAsyncAction.run(() => super.initProfile());
  }

  late final _$initDadosPessoaisAsyncAction =
      AsyncAction('ProfileStoreBase.initDadosPessoais', context: context);

  @override
  Future<void> initDadosPessoais() {
    return _$initDadosPessoaisAsyncAction.run(() => super.initDadosPessoais());
  }

  late final _$initEnderecosAsyncAction =
      AsyncAction('ProfileStoreBase.initEnderecos', context: context);

  @override
  Future<void> initEnderecos() {
    return _$initEnderecosAsyncAction.run(() => super.initEnderecos());
  }

  late final _$initConfiguracoesAsyncAction =
      AsyncAction('ProfileStoreBase.initConfiguracoes', context: context);

  @override
  Future<void> initConfiguracoes() {
    return _$initConfiguracoesAsyncAction.run(() => super.initConfiguracoes());
  }

  late final _$logoutAsyncAction =
      AsyncAction('ProfileStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('ProfileStoreBase.deleteAccount', context: context);

  @override
  Future<void> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$ProfileStoreBaseActionController =
      ActionController(name: 'ProfileStoreBase', context: context);

  @override
  void resetProfile() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetProfile');
    try {
      return super.resetProfile();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDadosPessoais() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetDadosPessoais');
    try {
      return super.resetDadosPessoais();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEnderecos() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetEnderecos');
    try {
      return super.resetEnderecos();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetConfiguracoes() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetConfiguracoes');
    try {
      return super.resetConfiguracoes();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dadosPessoaisModel: ${dadosPessoaisModel}
    ''';
  }
}
