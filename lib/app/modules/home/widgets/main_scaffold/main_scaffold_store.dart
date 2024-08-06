import 'package:mobx/mobx.dart';

part 'main_scaffold_store.g.dart';

class MainScaffoldStore = MainScaffoldStoreBase with _$MainScaffoldStore;

abstract class MainScaffoldStoreBase with Store {
  @action
  Future<void> init() async {}

  @action
  void reset() {}
}
