import 'package:laserfast_app/app/apis/cashback.api.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CashbackApi _cashbackApi = CashbackApi();

  final LoadingStore loadingStore = LoadingStore();

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

    cashback = r.data!.valor ?? 0;

    return;
  }
}
