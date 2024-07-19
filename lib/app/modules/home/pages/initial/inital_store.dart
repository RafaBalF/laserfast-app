import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:compregados_app_v2/loading_store.dart';

part 'inital_store.g.dart';

class InitialStore = InitialStoreBase with _$InitialStore;

abstract class InitialStoreBase with Store {
  //APIS

  //STORES
  final LoadingStore loadingStore = Modular.get<LoadingStore>();

  //SERVICES

  //OBSERVABLES

  //VARIABLES

  //COMPUTED

  //ACTIONS
  @action
  Future<void> init() async {}

  //METHODS
}
