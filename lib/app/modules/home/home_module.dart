import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/home/home_page.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(HomeStore.new);

    // Widgets
    i.addLazySingleton(BottomNavigationBarStore.new);
    i.addLazySingleton(MainScaffoldStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: defaultTransitonType,
    );
  }
}
