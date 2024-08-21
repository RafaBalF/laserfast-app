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
  SessaoModel? get currentSession {
    _$currentSessionAtom.reportRead();
    return super.currentSession;
  }

  @override
  set currentSession(SessaoModel? value) {
    _$currentSessionAtom.reportWrite(value, super.currentSession, () {
      super.currentSession = value;
    });
  }

  late final _$comandasAtom =
      Atom(name: 'SessaoStoreBase.comandas', context: context);

  @override
  ObservableList<SelectableCard<ComandaModel>> get comandas {
    _$comandasAtom.reportRead();
    return super.comandas;
  }

  @override
  set comandas(ObservableList<SelectableCard<ComandaModel>> value) {
    _$comandasAtom.reportWrite(value, super.comandas, () {
      super.comandas = value;
    });
  }

  late final _$comandaSelecionadaAtom =
      Atom(name: 'SessaoStoreBase.comandaSelecionada', context: context);

  @override
  ComandaModel? get comandaSelecionada {
    _$comandaSelecionadaAtom.reportRead();
    return super.comandaSelecionada;
  }

  @override
  set comandaSelecionada(ComandaModel? value) {
    _$comandaSelecionadaAtom.reportWrite(value, super.comandaSelecionada, () {
      super.comandaSelecionada = value;
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
  ObservableList<EventoSessaoModel> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<EventoSessaoModel> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$sessaoSendoAvaliadaAtom =
      Atom(name: 'SessaoStoreBase.sessaoSendoAvaliada', context: context);

  @override
  EventoSessaoModel? get sessaoSendoAvaliada {
    _$sessaoSendoAvaliadaAtom.reportRead();
    return super.sessaoSendoAvaliada;
  }

  @override
  set sessaoSendoAvaliada(EventoSessaoModel? value) {
    _$sessaoSendoAvaliadaAtom.reportWrite(value, super.sessaoSendoAvaliada, () {
      super.sessaoSendoAvaliada = value;
    });
  }

  late final _$aplicadorAtom =
      Atom(name: 'SessaoStoreBase.aplicador', context: context);

  @override
  AplicadorModel? get aplicador {
    _$aplicadorAtom.reportRead();
    return super.aplicador;
  }

  @override
  set aplicador(AplicadorModel? value) {
    _$aplicadorAtom.reportWrite(value, super.aplicador, () {
      super.aplicador = value;
    });
  }

  late final _$estabelecimentoAtom =
      Atom(name: 'SessaoStoreBase.estabelecimento', context: context);

  @override
  EstabelecimentoModel? get estabelecimento {
    _$estabelecimentoAtom.reportRead();
    return super.estabelecimento;
  }

  @override
  set estabelecimento(EstabelecimentoModel? value) {
    _$estabelecimentoAtom.reportWrite(value, super.estabelecimento, () {
      super.estabelecimento = value;
    });
  }

  late final _$notaSessaoAtom =
      Atom(name: 'SessaoStoreBase.notaSessao', context: context);

  @override
  double? get notaSessao {
    _$notaSessaoAtom.reportRead();
    return super.notaSessao;
  }

  @override
  set notaSessao(double? value) {
    _$notaSessaoAtom.reportWrite(value, super.notaSessao, () {
      super.notaSessao = value;
    });
  }

  late final _$notaEstabelecimentoAtom =
      Atom(name: 'SessaoStoreBase.notaEstabelecimento', context: context);

  @override
  double? get notaEstabelecimento {
    _$notaEstabelecimentoAtom.reportRead();
    return super.notaEstabelecimento;
  }

  @override
  set notaEstabelecimento(double? value) {
    _$notaEstabelecimentoAtom.reportWrite(value, super.notaEstabelecimento, () {
      super.notaEstabelecimento = value;
    });
  }

  late final _$sessaoParaCheckInAtom =
      Atom(name: 'SessaoStoreBase.sessaoParaCheckIn', context: context);

  @override
  EventoSessaoModel? get sessaoParaCheckIn {
    _$sessaoParaCheckInAtom.reportRead();
    return super.sessaoParaCheckIn;
  }

  @override
  set sessaoParaCheckIn(EventoSessaoModel? value) {
    _$sessaoParaCheckInAtom.reportWrite(value, super.sessaoParaCheckIn, () {
      super.sessaoParaCheckIn = value;
    });
  }

  late final _$fotoCheckInAtom =
      Atom(name: 'SessaoStoreBase.fotoCheckIn', context: context);

  @override
  XFile? get fotoCheckIn {
    _$fotoCheckInAtom.reportRead();
    return super.fotoCheckIn;
  }

  @override
  set fotoCheckIn(XFile? value) {
    _$fotoCheckInAtom.reportWrite(value, super.fotoCheckIn, () {
      super.fotoCheckIn = value;
    });
  }

  late final _$areasDisponiveisAtom =
      Atom(name: 'SessaoStoreBase.areasDisponiveis', context: context);

  @override
  ObservableList<SelectableCard<SessionAreaModel>> get areasDisponiveis {
    _$areasDisponiveisAtom.reportRead();
    return super.areasDisponiveis;
  }

  @override
  set areasDisponiveis(ObservableList<SelectableCard<SessionAreaModel>> value) {
    _$areasDisponiveisAtom.reportWrite(value, super.areasDisponiveis, () {
      super.areasDisponiveis = value;
    });
  }

  late final _$atendidoPorAtom =
      Atom(name: 'SessaoStoreBase.atendidoPor', context: context);

  @override
  AplicadorModel? get atendidoPor {
    _$atendidoPorAtom.reportRead();
    return super.atendidoPor;
  }

  @override
  set atendidoPor(AplicadorModel? value) {
    _$atendidoPorAtom.reportWrite(value, super.atendidoPor, () {
      super.atendidoPor = value;
    });
  }

  late final _$initAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.initAgendamento', context: context);

  @override
  Future<void> initAgendamento(int? id) {
    return _$initAgendamentoAsyncAction.run(() => super.initAgendamento(id));
  }

  late final _$getComandasAsyncAction =
      AsyncAction('SessaoStoreBase.getComandas', context: context);

  @override
  Future<void> getComandas() {
    return _$getComandasAsyncAction.run(() => super.getComandas());
  }

  late final _$salvarAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.salvarAgendamento', context: context);

  @override
  Future<void> salvarAgendamento() {
    return _$salvarAgendamentoAsyncAction.run(() => super.salvarAgendamento());
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
  Future<void> confirmSession(EventoSessaoModel evento) {
    return _$confirmSessionAsyncAction.run(() => super.confirmSession(evento));
  }

  late final _$initAvaliarAsyncAction =
      AsyncAction('SessaoStoreBase.initAvaliar', context: context);

  @override
  Future<void> initAvaliar() {
    return _$initAvaliarAsyncAction.run(() => super.initAvaliar());
  }

  late final _$getAplicadorEEstabelecimentoAsyncAction = AsyncAction(
      'SessaoStoreBase.getAplicadorEEstabelecimento',
      context: context);

  @override
  Future<void> getAplicadorEEstabelecimento() {
    return _$getAplicadorEEstabelecimentoAsyncAction
        .run(() => super.getAplicadorEEstabelecimento());
  }

  late final _$avaliarAsyncAction =
      AsyncAction('SessaoStoreBase.avaliar', context: context);

  @override
  Future<bool> avaliar() {
    return _$avaliarAsyncAction.run(() => super.avaliar());
  }

  late final _$initCheckInAsyncAction =
      AsyncAction('SessaoStoreBase.initCheckIn', context: context);

  @override
  Future<void> initCheckIn() {
    return _$initCheckInAsyncAction.run(() => super.initCheckIn());
  }

  late final _$buscarSessaoAsyncAction =
      AsyncAction('SessaoStoreBase.buscarSessao', context: context);

  @override
  Future<bool> buscarSessao() {
    return _$buscarSessaoAsyncAction.run(() => super.buscarSessao());
  }

  late final _$getAreasDisponiveisAsyncAction =
      AsyncAction('SessaoStoreBase.getAreasDisponiveis', context: context);

  @override
  Future<void> getAreasDisponiveis() {
    return _$getAreasDisponiveisAsyncAction
        .run(() => super.getAreasDisponiveis());
  }

  late final _$fazerCheckInAsyncAction =
      AsyncAction('SessaoStoreBase.fazerCheckIn', context: context);

  @override
  Future<bool> fazerCheckIn() {
    return _$fazerCheckInAsyncAction.run(() => super.fazerCheckIn());
  }

  late final _$SessaoStoreBaseActionController =
      ActionController(name: 'SessaoStoreBase', context: context);

  @override
  void setComandaSelecionada(ComandaModel? c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setComandaSelecionada');
    try {
      return super.setComandaSelecionada(c);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void selectComanda(ComandaModel c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selectComanda');
    try {
      return super.selectComanda(c);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectComanda(ComandaModel c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.unselectComanda');
    try {
      return super.unselectComanda(c);
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
  void setSessaoSendoAvaliada(EventoSessaoModel? s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setSessaoSendoAvaliada');
    try {
      return super.setSessaoSendoAvaliada(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotaSessao(double? d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setNotaSessao');
    try {
      return super.setNotaSessao(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotaEstabelecimento(double? d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setNotaEstabelecimento');
    try {
      return super.setNotaEstabelecimento(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAvaliar() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetAvaliar');
    try {
      return super.resetAvaliar();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSessaoParaCheckIn(EventoSessaoModel? s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setSessaoParaCheckIn');
    try {
      return super.setSessaoParaCheckIn(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setfotoCheckIn(XFile? b) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setfotoCheckIn');
    try {
      return super.setfotoCheckIn(b);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionarAreasDaSessao(SessionAreaModel session) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selecionarAreasDaSessao');
    try {
      return super.selecionarAreasDaSessao(session);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCheckIn() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetCheckIn');
    try {
      return super.resetCheckIn();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSession: ${currentSession},
comandas: ${comandas},
comandaSelecionada: ${comandaSelecionada},
startDate: ${startDate},
endDate: ${endDate},
sessionDuration: ${sessionDuration},
availableSchedules: ${availableSchedules},
selectedSchedule: ${selectedSchedule},
history: ${history},
sessaoSendoAvaliada: ${sessaoSendoAvaliada},
aplicador: ${aplicador},
estabelecimento: ${estabelecimento},
notaSessao: ${notaSessao},
notaEstabelecimento: ${notaEstabelecimento},
sessaoParaCheckIn: ${sessaoParaCheckIn},
fotoCheckIn: ${fotoCheckIn},
areasDisponiveis: ${areasDisponiveis},
atendidoPor: ${atendidoPor}
    ''';
  }
}
