// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiarioStore on DiarioStoreBase, Store {
  late final _$viuIntroAtom =
      Atom(name: 'DiarioStoreBase.viuIntro', context: context);

  @override
  bool get viuIntro {
    _$viuIntroAtom.reportRead();
    return super.viuIntro;
  }

  @override
  set viuIntro(bool value) {
    _$viuIntroAtom.reportWrite(value, super.viuIntro, () {
      super.viuIntro = value;
    });
  }

  late final _$etapaAtom =
      Atom(name: 'DiarioStoreBase.etapa', context: context);

  @override
  int get etapa {
    _$etapaAtom.reportRead();
    return super.etapa;
  }

  @override
  set etapa(int value) {
    _$etapaAtom.reportWrite(value, super.etapa, () {
      super.etapa = value;
    });
  }

  late final _$initDiarioAsyncAction =
      AsyncAction('DiarioStoreBase.initDiario', context: context);

  @override
  Future<void> initDiario() {
    return _$initDiarioAsyncAction.run(() => super.initDiario());
  }

  late final _$DiarioStoreBaseActionController =
      ActionController(name: 'DiarioStoreBase', context: context);

  @override
  void verIntro() {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.verIntro');
    try {
      return super.verIntro();
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDiario() {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.resetDiario');
    try {
      return super.resetDiario();
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viuIntro: ${viuIntro},
etapa: ${etapa}
    ''';
  }
}
