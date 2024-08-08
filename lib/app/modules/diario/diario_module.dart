import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/diario/diario_page.dart';
import 'package:laserfast_app/app/modules/diario/diario_store.dart';

class DiarioModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DiarioStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const DiarioPage(),
      transition: defaultTransitonType,
    );
  }
}
