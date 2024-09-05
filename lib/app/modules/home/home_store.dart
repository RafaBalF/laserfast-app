import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/apis/cashback.api.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CashbackApi _cashbackApi = CashbackApi();

  final LoadingStore loadingStore = LoadingStore();

  //==============================================
  //==== BOTTOM-BAR ==============================
  //==============================================

  final List<String> routes = [
    '/home/',
    '/sessao/historico',
    '/home/notificacoes',
    // '/pagamentos/',
    // '/chats/',
  ];

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int i) {
    if (i == 0) return;

    Modular.to.pushNamed(routes[i]);
  }

  //==============================================
  //==== HOME ====================================
  //==============================================

  @observable
  double cashback = 0.0;

  @action
  Future<void> initHome() async {
    await getCashback();
  }

  @action
  Future<void> getCashback() async {
    final r = await _cashbackApi.recuperarCashbackCliente();

    if (!r.success || r.data == null) return;

    cashback = r.data!.saldo ?? 0;

    return;
  }
}
