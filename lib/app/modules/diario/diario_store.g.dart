// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiarioStore on DiarioStoreBase, Store {
  late final _$initDiarioAsyncAction =
      AsyncAction('DiarioStoreBase.initDiario', context: context);

  @override
  Future<void> initDiario() {
    return _$initDiarioAsyncAction.run(() => super.initDiario());
  }

  late final _$DiarioStoreBaseActionController =
      ActionController(name: 'DiarioStoreBase', context: context);

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

    ''';
  }
}
