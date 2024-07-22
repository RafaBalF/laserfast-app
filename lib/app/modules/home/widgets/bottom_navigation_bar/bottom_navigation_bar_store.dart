import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_store.g.dart';

class BottomNavigationBarStore = BottomNavigationBarStoreBase
    with _$BottomNavigationBarStore;

abstract class BottomNavigationBarStoreBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int i) => selectedIndex = i;
}
