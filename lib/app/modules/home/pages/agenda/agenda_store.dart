import 'package:laserfast_app/app/models/session_area.model.dart';
import 'package:laserfast_app/app/shared/interfaces/selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'agenda_store.g.dart';

class AgendaStore = AgendaStoreBase with _$AgendaStore;

abstract class AgendaStoreBase with Store {
  //APIS

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //SERVICES

  //OBSERVABLES
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

  //VARIABLES

  //COMPUTED

  //ACTIONS
  @action
  Future<void> init() async {}

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
  }

  @action
  void unselectSessionArea(SessionAreaModel s) {
    decrementSessionDuration(s.duration ?? 0);
    selectedSessionAreas.remove(s);
  }

  @action
  void searchAvailableSchedules() {}

  @action
  void resetSessionArea() {
    sessionDuration = 0;

    sessionAreas.clear();
    selectedSessionAreas.clear();
  }

  @action
  void reset() {
    resetDates();
    resetSessionArea();
  }

  //METHODS
}
