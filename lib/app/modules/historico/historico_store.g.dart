// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricoStore on HistoricoStoreBase, Store {
  late final _$historyAtom =
      Atom(name: 'HistoricoStoreBase.history', context: context);

  @override
  ObservableList<SessionModel> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<SessionModel> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('HistoricoStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getHistoryAsyncAction =
      AsyncAction('HistoricoStoreBase.getHistory', context: context);

  @override
  Future<void> getHistory() {
    return _$getHistoryAsyncAction.run(() => super.getHistory());
  }

  late final _$HistoricoStoreBaseActionController =
      ActionController(name: 'HistoricoStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$HistoricoStoreBaseActionController.startAction(
        name: 'HistoricoStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$HistoricoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
history: ${history}
    ''';
  }
}
