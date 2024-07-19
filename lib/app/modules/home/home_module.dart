import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/modules/home/home_page.dart';
import 'package:compregados_app_v2/app/modules/home/home_store.dart';
import 'package:compregados_app_v2/app/modules/home/pages/initial/inital_page.dart';
import 'package:compregados_app_v2/app/modules/home/pages/initial/inital_store.dart';
import 'package:compregados_app_v2/app/modules/home/pages/profile/profile_page.dart';
import 'package:compregados_app_v2/app/modules/home/pages/profile/profile_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(InitialStore.new);
    i.addLazySingleton(ProfileStore.new);
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
