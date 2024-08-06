// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessaoStore on SessaoStoreBase, Store {
  late final _$currentSessionAtom =
      Atom(name: 'SessaoStoreBase.currentSession', context: context);

  @override
  SessionModel? get currentSession {
    _$currentSessionAtom.reportRead();
    return super.currentSession;
  }

  @override
  set currentSession(SessionModel? value) {
    _$currentSessionAtom.reportWrite(value, super.currentSession, () {
      super.currentSession = value;
    });
  }

  late final _$startDateAtom =
      Atom(name: 'SessaoStoreBase.startDate', context: context);

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
      Atom(name: 'SessaoStoreBase.endDate', context: context);

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
      Atom(name: 'SessaoStoreBase.sessionDuration', context: context);

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

  late final _$sessionAreasAtom =
      Atom(name: 'SessaoStoreBase.sessionAreas', context: context);

  @override
  ObservableList<SelectableCard<SessionAreaModel>> get sessionAreas {
    _$sessionAreasAtom.reportRead();
    return super.sessionAreas;
  }

  @override
  set sessionAreas(ObservableList<SelectableCard<SessionAreaModel>> value) {
    _$sessionAreasAtom.reportWrite(value, super.sessionAreas, () {
      super.sessionAreas = value;
    });
  }

  late final _$selectedSessionAreasAtom =
      Atom(name: 'SessaoStoreBase.selectedSessionAreas', context: context);

  @override
  ObservableList<SessionAreaModel> get selectedSessionAreas {
    _$selectedSessionAreasAtom.reportRead();
    return super.selectedSessionAreas;
  }

  @override
  set selectedSessionAreas(ObservableList<SessionAreaModel> value) {
    _$selectedSessionAreasAtom.reportWrite(value, super.selectedSessionAreas,
        () {
      super.selectedSessionAreas = value;
    });
  }

  late final _$availableSchedulesAtom =
      Atom(name: 'SessaoStoreBase.availableSchedules', context: context);

  @override
  ObservableList<AvailableSchedulesModel> get availableSchedules {
    _$availableSchedulesAtom.reportRead();
    return super.availableSchedules;
  }

  @override
  set availableSchedules(ObservableList<AvailableSchedulesModel> value) {
    _$availableSchedulesAtom.reportWrite(value, super.availableSchedules, () {
      super.availableSchedules = value;
    });
  }

  late final _$selectedScheduleAtom =
      Atom(name: 'SessaoStoreBase.selectedSchedule', context: context);

  @override
  AvailableSchedulesModel? get selectedSchedule {
    _$selectedScheduleAtom.reportRead();
    return super.selectedSchedule;
  }

  @override
  set selectedSchedule(AvailableSchedulesModel? value) {
    _$selectedScheduleAtom.reportWrite(value, super.selectedSchedule, () {
      super.selectedSchedule = value;
    });
  }

  late final _$historyAtom =
      Atom(name: 'SessaoStoreBase.history', context: context);

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

  late final _$initAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.initAgendamento', context: context);

  @override
  Future<void> initAgendamento(int? id) {
    return _$initAgendamentoAsyncAction.run(() => super.initAgendamento(id));
  }

  late final _$submitAsyncAction =
      AsyncAction('SessaoStoreBase.submit', context: context);

  @override
  Future<BaseModel<StringResponseModel>> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  late final _$initHistoryAsyncAction =
      AsyncAction('SessaoStoreBase.initHistory', context: context);

  @override
  Future<void> initHistory() {
    return _$initHistoryAsyncAction.run(() => super.initHistory());
  }

  late final _$getHistoryAsyncAction =
      AsyncAction('SessaoStoreBase.getHistory', context: context);

  @override
  Future<void> getHistory() {
    return _$getHistoryAsyncAction.run(() => super.getHistory());
  }

  late final _$confirmSessionAsyncAction =
      AsyncAction('SessaoStoreBase.confirmSession', context: context);

  @override
  Future<void> confirmSession(SessionModel session) {
    return _$confirmSessionAsyncAction.run(() => super.confirmSession(session));
  }

  late final _$SessaoStoreBaseActionController =
      ActionController(name: 'SessaoStoreBase', context: context);

  @override
  void setStartDate(DateTime date) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setStartDate');
    try {
      return super.setStartDate(date);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime date) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDates() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetDates');
    try {
      return super.resetDates();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSessionAreas() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.getSessionAreas');
    try {
      return super.getSessionAreas();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSessionDuration(int d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.incrementSessionDuration');
    try {
      return super.incrementSessionDuration(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementSessionDuration(int d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.decrementSessionDuration');
    try {
      return super.decrementSessionDuration(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSessionArea(SessionAreaModel s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selectSessionArea');
    try {
      return super.selectSessionArea(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectSessionArea(SessionAreaModel s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.unselectSessionArea');
    try {
      return super.unselectSessionArea(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAvailableSchedules() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.getAvailableSchedules');
    try {
      return super.getAvailableSchedules();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSchedule(AvailableSchedulesModel? s, DateTime? schedule) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selectSchedule');
    try {
      return super.selectSchedule(s, schedule);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSessionArea() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetSessionArea');
    try {
      return super.resetSessionArea();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSchedules() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetSchedules');
    try {
      return super.resetSchedules();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAgendamento() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetAgendamento');
    try {
      return super.resetAgendamento();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetHistory() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetHistory');
    try {
      return super.resetHistory();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSession: ${currentSession},
startDate: ${startDate},
endDate: ${endDate},
sessionDuration: ${sessionDuration},
sessionAreas: ${sessionAreas},
selectedSessionAreas: ${selectedSessionAreas},
availableSchedules: ${availableSchedules},
selectedSchedule: ${selectedSchedule},
history: ${history}
    ''';
  }
}
