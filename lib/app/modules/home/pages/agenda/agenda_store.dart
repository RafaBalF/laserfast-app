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

  //METHODS
}
