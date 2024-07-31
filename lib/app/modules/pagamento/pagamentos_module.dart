import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamentos_page.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamentos_store.dart';
import 'package:laserfast_app/app/modules/pagamento/pages/pagamento_page.dart';

class PagamentoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(PagamentosStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const PagamentosPage());
    r.child('/pagamento', child: (context) => const PagamentoPage());
  }
}
