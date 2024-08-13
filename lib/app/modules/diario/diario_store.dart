import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'diario_store.g.dart';

class DiarioStore = DiarioStoreBase with _$DiarioStore;

abstract class DiarioStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  @observable
  bool viuIntro = false;
  @observable
  int etapa = 0;

  @action
  Future<void> initDiario() async {
    verIntro();
    _loginHive.getLogin();
  }

  @action
  void verIntro() => viuIntro = true;

  @action
  void resetDiario() {}
}
