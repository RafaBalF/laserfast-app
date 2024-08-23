import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/apis/sessao.api.dart';
import 'package:laserfast_app/app/models/aplicador.model.dart';
import 'package:laserfast_app/app/models/comanda.model.dart';
import 'package:laserfast_app/app/models/estabelecimento.model.dart';
import 'package:laserfast_app/app/models/evento_sessao.model.dart';
import 'package:laserfast_app/app/models/horarios_disponiveis_com_opcoes.model.dart';
import 'package:laserfast_app/app/models/sessao.model.dart';
import 'package:laserfast_app/app/models/session_area.model.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/models/hora_display.model.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/models/horarios_display.model.dart';
import 'package:laserfast_app/app/shared/interfaces/selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'sessao_store.g.dart';

class SessaoStore = SessaoStoreBase with _$SessaoStore;

abstract class SessaoStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  final SessaoApi _sessaoApi = SessaoApi();

  //==============================================
  //==== AGENDAMENTO =============================
  //==============================================

  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @observable
  SessaoModel? sessaoAtual;

  @observable
  ObservableList<SelectableCard<ComandaModel>> comandas = ObservableList.of([]);
  @observable
  ComandaModel? comandaSelecionada;

  @action
  Future<void> initAgendamento(int? id) async {
    await getComandas();
  }

  @action
  Future<void> getComandas() async {
    final r = await _sessaoApi.listarComandasComSessoesDisponiveisPorCPF();

    if (!r.success) return;

    for (var c in r.list!) {
      if (!podeSerAgendada(c)) continue;

      comandas.add(SelectableCard(
        label: c.item ?? "",
        value: c,
        onSelect: () {
          selectComanda(c);
        },
        onUnselect: () {
          unselectComanda(c);
        },
      ));
    }
  }

  bool podeSerAgendada(ComandaModel c) {
    return c.comandaSemAssinaturas == false ||
        (c.codigoSessaoEmAberto != null && c.dataSessaoEmAberto != null) ||
        c.comandaInadimplente == true ||
        c.comandaTransferida == true;
  }

  @action
  void setComandaSelecionada(ComandaModel? c) => comandaSelecionada = c;

  @observable
  DateTime? startDate;
  @observable
  DateTime? endDate;

  @computed
  bool get podeBuscarHorarios => startDate != null && endDate != null;

  @observable
  int duracaoSessao = 0;

  @action
  void setStartDate(DateTime date) => startDate = date;
  @action
  void setEndDate(DateTime date) => endDate = date;
  @action
  void resetDates() => startDate = endDate = null;

  @action
  void incrementDuracaoSessao(int d) => duracaoSessao += d;
  @action
  void decrementDuracaoSessao(int d) => duracaoSessao -= d;

  @action
  void selectComanda(ComandaModel c) {
    setComandaSelecionada(c);
    incrementDuracaoSessao(c.tempoSessao ?? 0);
  }

  @action
  void unselectComanda(ComandaModel c) {
    setComandaSelecionada(null);
    decrementDuracaoSessao(c.tempoSessao ?? 0);
  }

  @observable
  HorariosDisponiveisComOpcoesModel? horarios;
  @observable
  ObservableList<HorariosDisplayModel> horariosDisplay = ObservableList.of([]);
  @observable
  DateTime? horarioSelecionado;

  @action
  Future<void> buscarHorarios() async {
    loadingStore.show();

    if (comandaSelecionada == null || startDate == null || endDate == null) {
      return;
    }

    final r = await _sessaoApi.listarHorariosDisponiveisComOpcoes(
      comandaSelecionada!.codigoUnidade!,
      comandaSelecionada!.tempoSessao!,
      startDate!,
      endDate!,
    );

    loadingStore.hide();

    if (!r.success) return;

    horariosDisplay.clear();
    desselecionarHorario();

    horarios = r.data;

    horarios!.horarios!.length;

    final DateFormat diaFormatter = DateFormat("dd/MM");
    final DateFormat horaFormatter = DateFormat("hh:mm");

    final dias = <int>[];

    for (var i = 0; i < horarios!.horarios!.length; i++) {
      final horario = horarios!.horarios![i];

      final dia = horario.day;

      if (!dias.contains(dia)) dias.add(dia);
    }

    for (var d in dias) {
      final horas = horarios!.horarios!.where((h) => h.day == d).toList();

      if (horas.isEmpty) continue;

      List<HoraDisplay> horaDisplays = [];

      for (var h in horas) {
        horaDisplays.add(HoraDisplay(hora: horaFormatter.format(h), valor: h));
      }

      horariosDisplay.add(HorariosDisplayModel(
        dia: diaFormatter.format(horas.first),
        horarios: horaDisplays,
      ));
    }

    // for (var i = 0; i < horarios!.horarios!.length; i++) {
    //   final horario = horarios!.horarios![i];

    //   horariosDisplay.add(SelectableCard(
    //     label: formatter.format(horario),
    //     value: horario,
    //     onSelect: () {
    //       selecionarHorario(horario);
    //     },
    //     onUnselect: () {
    //       desselecionarHorario();
    //     },
    //   ));
    // }
  }

  @action
  void selecionarHorario(DateTime d) => horarioSelecionado = d;

  @action
  void desselecionarHorario() => horarioSelecionado = null;

  @action
  Future<void> salvarAgendamento() async {}

  @action
  void resetDuracaoSessao() {
    duracaoSessao = 0;
  }

  @action
  void resetAgendamento() {
    resetDates();
    resetDuracaoSessao();
    horarios = null;
    horariosDisplay.clear();
    desselecionarHorario();
  }

  //==============================================
  //==== HISTÓRICO ===============================
  //==============================================

  @observable
  ObservableList<EventoSessaoModel> history = ObservableList.of([]);

  @action
  Future<void> initHistory() async {
    await getHistory();
  }

  @action
  Future<void> getHistory() async {
    var r = await _sessaoApi.listarHistoricoUltimasSessoes();

    final sessoes = r.list ?? [];

    final eventos = <EventoSessaoModel>[];

    for (var sessao in sessoes) {
      eventos.addAll(sessao.eventos!);
    }

    history.addAll(eventos);
  }

  @action
  Future<void> confirmSession(EventoSessaoModel evento) async {
    var s = history.indexWhere((s) => s.codigoEvento == evento.codigoEvento);

    if (s == -1) return;

    var newSession = EventoSessaoModel.createNew(evento);

    newSession.status = 'Confirmado';

    history[s] = newSession;
  }

  @action
  void resetHistory() {
    history.clear();
  }

  //==============================================
  //==== AVALIAR =================================
  //==============================================

  @observable
  EventoSessaoModel? sessaoSendoAvaliada;
  @observable
  AplicadorModel? aplicador;
  @observable
  EstabelecimentoModel? estabelecimento;
  @observable
  double? notaSessao;
  @observable
  double? notaEstabelecimento;

  @action
  Future<void> initAvaliar() async {
    getAplicadorEEstabelecimento();
  }

  @action
  Future<void> getAplicadorEEstabelecimento() async {
    aplicador = AplicadorModel(
      id: 1,
      nome: "Lara Souza",
      atendimentos: 132,
      foto: null,
    );

    estabelecimento = EstabelecimentoModel(
      id: 1,
      nome: "LASER FAST UNIDADE REDENTORA",
      foto: null,
    );
  }

  @action
  void setSessaoSendoAvaliada(EventoSessaoModel? s) => sessaoSendoAvaliada = s;
  @action
  void setNotaSessao(double? d) => notaSessao = d;
  @action
  void setNotaEstabelecimento(double? d) => notaEstabelecimento = d;

  @action
  Future<bool> avaliar() async {
    return true;
  }

  @action
  void resetAvaliar() {
    setSessaoSendoAvaliada(null);
    setNotaSessao(null);
    setNotaEstabelecimento(null);
  }

  //==============================================
  //==== CHECK-IN ================================
  //==============================================

  @observable
  EventoSessaoModel? sessaoParaCheckIn;
  @observable
  XFile? fotoCheckIn;
  @observable
  ObservableList<SelectableCard<SessionAreaModel>> areasDisponiveis =
      ObservableList.of([]);
  @observable
  AplicadorModel? atendidoPor;

  @action
  Future<void> initCheckIn() async {
    await buscarSessao();
  }

  @action
  void setSessaoParaCheckIn(EventoSessaoModel? s) => sessaoParaCheckIn = s;
  @action
  void setfotoCheckIn(XFile? b) => fotoCheckIn = b;

  @action
  Future<bool> buscarSessao() async {
    await getAreasDisponiveis();

    return true;
  }

  @action
  Future<void> getAreasDisponiveis() async {
    areasDisponiveis.clear();

    List<SelectableCard<SessionAreaModel>> items = [];

    areasDisponiveis.addAll(items);
  }

  @action
  void selecionarAreasDaSessao(SessionAreaModel session) {
    if (sessaoParaCheckIn == null) return;
  }

  @action
  Future<bool> fazerCheckIn() async {
    atendidoPor = AplicadorModel(
      id: 1,
      nome: "Lara Souza",
      atendimentos: 132,
      foto: null,
    );

    return true;
  }

  @action
  void resetCheckIn() {
    setSessaoParaCheckIn(null);
    setfotoCheckIn(null);
    areasDisponiveis.clear();
    atendidoPor = null;
  }
}
