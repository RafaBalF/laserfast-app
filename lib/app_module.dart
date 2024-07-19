import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/modules/auth/auth_module.dart';
import 'package:compregados_app_v2/app/modules/home/home_module.dart';
import 'package:compregados_app_v2/app/modules/launch/launch_module.dart';
import 'package:compregados_app_v2/loading_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoadingStore.new);
  }

  @override
  void routes(r) {
    r.module(
      '/',
      module: LaunchModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/auth',
      module: AuthModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/home',
      module: HomeModule(),
      transition: TransitionType.rightToLeft,
    );
  }
}
