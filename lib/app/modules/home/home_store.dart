import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:compregados_app_v2/app/models/hives/login.hive.dart';
import 'package:compregados_app_v2/loading_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  //APIS
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = Modular.get<LoadingStore>();

  //OBSERVABLE
  @observable
  bool logged = false;
  @observable
  String? address;
  @observable
  int selectedIndex = 0;

  // COMPUTED

  //ACTION
  @action
  void initHome() {
    isLogged();
  }

  @action
  void isLogged() {
    logged = _loginHive.isLogged();
  }

  @action
  void setSelectedIndex(int i) => selectedIndex = i;

  //MISC
}
