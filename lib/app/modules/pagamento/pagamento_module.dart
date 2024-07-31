import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamento_page.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamento_store.dart';

class PagamentoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(PagamentoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const PagamentoPage());
  }
}
