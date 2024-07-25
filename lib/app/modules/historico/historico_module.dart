import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/historico/historico_page.dart';
import 'package:laserfast_app/app/modules/historico/historico_store.dart';

class HistoricoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(HistoricoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HistoricoPage());
  }
}
