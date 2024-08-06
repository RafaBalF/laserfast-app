import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/agenda/agenda_page.dart';
import 'package:laserfast_app/app/modules/agenda/agenda_store.dart';

class AgendaModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(AgendaStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const AgendaPage(),
      transition: defaultTransitonType,
    );
  }
}
