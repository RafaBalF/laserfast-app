import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/indicar/indicar_page.dart';
import 'package:laserfast_app/app/modules/indicar/indicar_store.dart';

class IndicarModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(IndicarStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const IndicarPage(),
      transition: defaultTransitonType,
    );
  }
}
