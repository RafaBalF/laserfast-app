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

  late final _$sessionAreasAtom =
      Atom(name: 'AgendaStoreBase.sessionAreas', context: context);

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
      Atom(name: 'AgendaStoreBase.selectedSessionAreas', context: context);

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
      Atom(name: 'AgendaStoreBase.availableSchedules', context: context);

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
      Atom(name: 'AgendaStoreBase.selectedSchedule', context: context);

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
  void getSessionAreas() {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.getSessionAreas');
    try {
      return super.getSessionAreas();
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSessionDuration(int d) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.incrementSessionDuration');
    try {
      return super.incrementSessionDuration(d);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementSessionDuration(int d) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.decrementSessionDuration');
    try {
      return super.decrementSessionDuration(d);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSessionArea(SessionAreaModel s) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.selectSessionArea');
    try {
      return super.selectSessionArea(s);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectSessionArea(SessionAreaModel s) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.unselectSessionArea');
    try {
      return super.unselectSessionArea(s);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAvailableSchedules() {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.getAvailableSchedules');
    try {
      return super.getAvailableSchedules();
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSchedule(AvailableSchedulesModel? s, DateTime? schedule) {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.selectSchedule');
    try {
      return super.selectSchedule(s, schedule);
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSessionArea() {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.resetSessionArea');
    try {
      return super.resetSessionArea();
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$AgendaStoreBaseActionController.startAction(
        name: 'AgendaStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$AgendaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startDate: ${startDate},
endDate: ${endDate},
sessionDuration: ${sessionDuration},
sessionAreas: ${sessionAreas},
selectedSessionAreas: ${selectedSessionAreas},
availableSchedules: ${availableSchedules},
selectedSchedule: ${selectedSchedule}
    ''';
  }
}
