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

  late final _$resetProfileAsyncAction =
      AsyncAction('ProfileStoreBase.resetProfile', context: context);

  @override
  Future<void> resetProfile() {
    return _$resetProfileAsyncAction.run(() => super.resetProfile());
  }

  late final _$initDadosPessoaisAsyncAction =
      AsyncAction('ProfileStoreBase.initDadosPessoais', context: context);

  @override
  Future<void> initDadosPessoais() {
    return _$initDadosPessoaisAsyncAction.run(() => super.initDadosPessoais());
  }

  late final _$resetDadosPessoaisAsyncAction =
      AsyncAction('ProfileStoreBase.resetDadosPessoais', context: context);

  @override
  Future<void> resetDadosPessoais() {
    return _$resetDadosPessoaisAsyncAction
        .run(() => super.resetDadosPessoais());
  }

  @override
  String toString() {
    return '''
dadosPessoaisModel: ${dadosPessoaisModel}
    ''';
  }
}
