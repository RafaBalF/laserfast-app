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

  //VARIABLES

  //COMPUTED

  //ACTIONS
  @action
  Future<void> init() async {}

  //METHODS
}
