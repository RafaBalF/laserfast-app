import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/modules/launch/launch_page.dart';
import 'package:compregados_app_v2/app/modules/launch/launch_store.dart';

class LaunchModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LaunchStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LaunchPage(),
      transition: TransitionType.rightToLeft,
    );
  }
}
