import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'historico_store.g.dart';

class HistoricoStore = HistoricoStoreBase with _$HistoricoStore;

abstract class HistoricoStoreBase with Store {
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

  @action
  void reset() {}

  //METHODS
}
