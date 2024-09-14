import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/parceiros/parceiros_page.dart';
import 'package:laserfast_app/app/modules/parceiros/parceiros_store.dart';

class ParceirosModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ParceirosStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ParceirosPage(),
      transition: defaultTransitonType,
    );
  }
}
