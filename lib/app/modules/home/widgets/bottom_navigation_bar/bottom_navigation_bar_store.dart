import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_store.g.dart';

class BottomNavigationBarStore = BottomNavigationBarStoreBase
    with _$BottomNavigationBarStore;

abstract class BottomNavigationBarStoreBase with Store {
  final List<String> routes = ['/home/', '/agenda/', '/pagamentos/', '/chats/'];

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int i) {
    if (i == 0) return;

    Modular.to.pushNamed(routes[i]);
  }
}
