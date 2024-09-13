import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/apis/banner.api.dart';
import 'package:laserfast_app/app/apis/cashback.api.dart';
import 'package:laserfast_app/app/models/banner.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CashbackApi _cashbackApi = CashbackApi();
  final BannerApi _bannerApi = BannerApi();

  final LoadingStore loadingStore = LoadingStore();

  //==============================================
  //==== BOTTOM-BAR ==============================
  //==============================================

  final List<String> routes = [
    '/home/',
    '/sessao/historico',
    '/notificacoes/',
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
  //==== SCAFFOLD ================================
  //==============================================

  //==============================================
  //==== HOME ====================================
  //==============================================

  @observable
  double cashback = 0.0;
  @observable
  ObservableList<BannerModel> banners = ObservableList.of([]);

  @action
  Future<void> getCashback() async {
    final r = await _cashbackApi.recuperarCashbackCliente();

    if (!r.success || r.data == null) return;

    cashback = r.data!.saldo ?? 0;
  }

  @action
  Future<void> getBanners() async {
    final r = await _bannerApi.listarBannersAplicativo();

    if (!r.success) return;

    // TODO: implementar banners quando tiver algum

    banners.addAll(r.list!);
  }
}
