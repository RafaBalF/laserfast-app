import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_store.g.dart';

class BottomNavigationBarStore = BottomNavigationBarStoreBase
    with _$BottomNavigationBarStore;

abstract class BottomNavigationBarStoreBase with Store {
  List<String> routes = ['/home/', '/agenda/'];

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int i) {
    selectedIndex = 0;

    switch (i) {
      case 1:
        Modular.to.pushNamed(routes[1]);
        break;
      default:
        Modular.to.navigate(routes[0]);
        break;
    }
  }
}
