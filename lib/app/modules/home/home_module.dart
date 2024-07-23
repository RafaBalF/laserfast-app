import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_page.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/modules/home/pages/agenda/agenda_page.dart';
import 'package:laserfast_app/app/modules/home/pages/agenda/agenda_store.dart';
import 'package:laserfast_app/app/modules/home/pages/profile/profile_page.dart';
import 'package:laserfast_app/app/modules/home/pages/profile/profile_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(AgendaStore.new);
    i.addLazySingleton(ProfileStore.new);

    // Widgets
    i.addLazySingleton(BottomNavigationBarStore.new);
    i.addLazySingleton(MainScaffoldStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/agenda', child: (context) => const AgendaPage());
    r.child('/profile', child: (context) => const ProfilePage());
  }
}
