import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'indicar_store.g.dart';

class IndicarStore = IndicarStoreBase with _$IndicarStore;

abstract class IndicarStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  @action
  Future<void> init() async {}

  @action
  void reset() {}
}
