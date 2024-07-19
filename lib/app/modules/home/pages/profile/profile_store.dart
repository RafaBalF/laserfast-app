import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:compregados_app_v2/loading_store.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
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
