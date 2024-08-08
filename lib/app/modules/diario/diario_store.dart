import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'diario_store.g.dart';

class DiarioStore = DiarioStoreBase with _$DiarioStore;

abstract class DiarioStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  @action
  Future<void> initDiario() async {
    _loginHive.getLogin();
  }

  @action
  void resetDiario() {}
}
