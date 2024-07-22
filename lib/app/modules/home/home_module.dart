import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_page.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/modules/home/pages/initial/inital_page.dart';
import 'package:laserfast_app/app/modules/home/pages/initial/inital_store.dart';
import 'package:laserfast_app/app/modules/home/pages/profile/profile_page.dart';
import 'package:laserfast_app/app/modules/home/pages/profile/profile_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(InitialStore.new);
    i.addLazySingleton(ProfileStore.new);
    i.addLazySingleton(BottomNavigationBarStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage(), children: [
      ChildRoute(
        '/initial',
        child: (context) => const InitialPage(),
        transition: TransitionType.rightToLeft,
      ),
      ChildRoute(
        '/profile',
        child: (context) => const ProfilePage(),
        transition: TransitionType.rightToLeft,
      ),
    ]);
  }
}
