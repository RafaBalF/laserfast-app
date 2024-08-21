import 'package:image_picker/image_picker.dart';
import 'package:laserfast_app/app/apis/sessao.api.dart';
import 'package:laserfast_app/app/models/aplicador.model.dart';
import 'package:laserfast_app/app/models/available_schedule.model.dart';
import 'package:laserfast_app/app/models/comanda.model.dart';
import 'package:laserfast_app/app/models/estabelecimento.model.dart';
import 'package:laserfast_app/app/models/evento_sessao.model.dart';
import 'package:laserfast_app/app/models/sessao.model.dart';
import 'package:laserfast_app/app/models/session_area.model.dart';
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

  @observable
  SessaoModel? currentSession;

  @observable
  ObservableList<SelectableCard<ComandaModel>> comandas = ObservableList.of([]);
  @observable
  ComandaModel? comandaSelecionada;

  @observable
  DateTime? startDate;
  @observable
  DateTime? endDate;

  @observable
  int sessionDuration = 0;

  @observable
  ObservableList<AvailableSchedulesModel> availableSchedules =
      ObservableList.of([]);

  @observable
  AvailableSchedulesModel? selectedSchedule;

  @action
  Future<void> initAgendamento(int? id) async {
    await getComandas();
  }

  @action
  Future<void> getComandas() async {
    final r = await _sessaoApi.listarComandasComSessoesDisponiveisPorCPF();

    if (!r.success) return;

    for (var c in r.list!) {
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

  @action
  void setComandaSelecionada(ComandaModel? c) => comandaSelecionada = c;

  @action
  void setStartDate(DateTime date) => startDate = date;
  @action
  void setEndDate(DateTime date) => endDate = date;
  @action
  void resetDates() => startDate = endDate = null;

  @action
  void incrementSessionDuration(int d) => sessionDuration += d;
  @action
  void decrementSessionDuration(int d) => sessionDuration -= d;

  @action
  void selectComanda(ComandaModel c) {
    setComandaSelecionada(c);
    incrementSessionDuration(c.tempoSessao ?? 0);
    resetSchedules();
  }

  @action
  void unselectComanda(ComandaModel c) {
    setComandaSelecionada(null);
    decrementSessionDuration(c.tempoSessao ?? 0);
    resetSchedules();
  }

  @action
  Future<void> salvarAgendamento() async {}

  @action
  void resetSessionArea() {
    sessionDuration = 0;
  }

  @action
  void resetSchedules() {
    availableSchedules.clear();
  }

  @action
  void resetAgendamento() {
    resetDates();
    resetSessionArea();
    resetSchedules();
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
