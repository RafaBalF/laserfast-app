// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgendaStore on AgendaStoreBase, Store {
  late final _$startDateAtom =
      Atom(name: 'AgendaStoreBase.startDate', context: context);

  @override
  DateTime? get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(DateTime? value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: 'AgendaStoreBase.endDate', context: context);

  @override
  DateTime? get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime? value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$sessionDurationAtom =
      Atom(name: 'AgendaStoreBase.sessionDuration', context: context);

  @override
  int get sessionDuration {
    _$sessionDurationAtom.reportRead();
    return super.sessionDuration;
  }

  @override
  set sessionDuration(int value) {
    _$sessionDurationAtom.reportWrite(value, super.sessionDuration, () {
      super.sessionDuration = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('AgendaStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$AgendaStoreBaseActionController =
      ActionController(name: 'AgendaStoreBase', context: context);

  @override
  void setStartDate(DateTime date) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.setStartDate');
    try {
      return super.setStartDate(date);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime date) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDates() {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.resetDates');
    try {
      return super.resetDates();
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startDate: ${startDate},
endDate: ${endDate},
sessionDuration: ${sessionDuration}
    ''';
  }
}
