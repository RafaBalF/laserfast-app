import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/parceiros/parceiros_page.dart';

class ParceirosModule extends Module {
  @override
  void binds(i) {
    // Pages
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ParceirosPage());
  }
}
