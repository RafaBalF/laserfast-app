import 'dart:math';

import 'package:laserfast_app/app/models/available_schedule.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/session.model.dart';
import 'package:laserfast_app/app/models/session_area.model.dart';
import 'package:laserfast_app/app/models/string_response.model.dart';
import 'package:laserfast_app/app/shared/interfaces/selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'sessao_store.g.dart';

class SessaoStore = SessaoStoreBase with _$SessaoStore;

abstract class SessaoStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  //==============================================
  //==== AGENDAMENTO =============================
  //==============================================

  @observable
  SessionModel? currentSession;

  @observable
  DateTime? startDate;
  @observable
  DateTime? endDate;

  @observable
  int sessionDuration = 0;
  @observable
  ObservableList<SelectableCard<SessionAreaModel>> sessionAreas =
      ObservableList.of([]);
  @observable
  ObservableList<SessionAreaModel> selectedSessionAreas = ObservableList.of([]);

  @observable
  ObservableList<AvailableSchedulesModel> availableSchedules =
      ObservableList.of([]);

  @observable
  AvailableSchedulesModel? selectedSchedule;

  @action
  Future<void> initAgendamento(int? id) async {}

  @action
  void setStartDate(DateTime date) => startDate = date;
  @action
  void setEndDate(DateTime date) => endDate = date;
  @action
  void resetDates() => startDate = endDate = null;

  @action
  void getSessionAreas() {
    sessionAreas.clear();

    List<SessionAreaModel> sessions = [
      SessionAreaModel(
        name: 'Virilha (5 min)',
        duration: 5,
      ),
      SessionAreaModel(
        name: 'Buço',
        duration: 10,
      ),
      SessionAreaModel(
        name: 'Axilas (10 sessões)',
        duration: 15,
      ),
      SessionAreaModel(
        name: 'Coxas',
        duration: 10,
      ),
      SessionAreaModel(
        name: 'Rosto inteiro',
        duration: 15,
      ),
      SessionAreaModel(
        name: 'Linha alba',
        duration: 15,
      ),
      SessionAreaModel(
        name: 'Braços e mãos',
        duration: 20,
      ),
    ];

    List<SelectableCard<SessionAreaModel>> items = [];

    for (var s in sessions) {
      items.add(SelectableCard(
        label: s.name.toString(),
        value: s,
        onSelect: () {
          selectSessionArea(s);
        },
        onUnselect: () {
          unselectSessionArea(s);
        },
      ));
    }

    sessionAreas.addAll(items);
  }

  @action
  void incrementSessionDuration(int d) => sessionDuration += d;
  @action
  void decrementSessionDuration(int d) => sessionDuration -= d;

  @action
  void selectSessionArea(SessionAreaModel s) {
    incrementSessionDuration(s.duration ?? 0);
    selectedSessionAreas.add(s);
    resetSchedules();
  }

  @action
  void unselectSessionArea(SessionAreaModel s) {
    decrementSessionDuration(s.duration ?? 0);
    selectedSessionAreas.remove(s);
    resetSchedules();
  }

  @action
  void getAvailableSchedules() {
    availableSchedules.clear();

    List<AvailableSchedulesModel> schedules = [];

    final now = DateTime.now();

    for (var i = 0; i < 3; i++) {
      final currentDay = DateTime(now.year, now.month, now.day + i);
      final count = Random().nextInt(3) + 5;

      final sc = List<DateTime>.empty(growable: true);

      for (var j = 0; j < count; j++) {
        sc.add(DateTime(
          currentDay.year,
          currentDay.month,
          currentDay.day,
          count + j,
        ));
      }

      schedules.add(AvailableSchedulesModel(
        day: currentDay,
        schedules: sc,
        sessionCode: i,
        duration: count * 3,
      ));
    }

    availableSchedules.addAll(schedules);
  }

  @action
  void selectSchedule(AvailableSchedulesModel? s, DateTime? schedule) {
    selectedSchedule = s;

    if (selectedSchedule == null) return;

    selectedSchedule!.selectedDate = schedule;

    selectedSchedule = AvailableSchedulesModel.createNew(selectedSchedule!);
  }

  @action
  Future<BaseModel<StringResponseModel>> submit() async {
    BaseModel<StringResponseModel> r = BaseModel<StringResponseModel>();

    if (selectedSchedule != null) {
      r.status = true;
      r.message = "Sua sessão foi salva com sucesso";
    }

    return r;
  }

  @action
  void resetSessionArea() {
    sessionDuration = 0;

    sessionAreas.clear();
    selectedSessionAreas.clear();
  }

  @action
  void resetSchedules() {
    selectSchedule(null, null);
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
  ObservableList<SessionModel> history = ObservableList.of([]);

  @action
  Future<void> initHistory() async {
    await getHistory();
  }

  @action
  Future<void> getHistory() async {
    List<SessionModel> sessions = [
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão realizada',
        statusCode: 0,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Falta',
        statusCode: 1,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão agendada',
        statusCode: 2,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão em andamento',
        statusCode: 3,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão confirmada',
        statusCode: 4,
      ),
    ];

    history.addAll(sessions);
  }

  @action
  void resetHistory() {
    history.clear();
  }
}
