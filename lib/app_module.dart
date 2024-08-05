import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/agenda/agenda_module.dart';
import 'package:laserfast_app/app/modules/auth/auth_module.dart';
import 'package:laserfast_app/app/modules/faq/faq_module.dart';
import 'package:laserfast_app/app/modules/historico/historico_module.dart';
import 'package:laserfast_app/app/modules/home/home_module.dart';
import 'package:laserfast_app/app/modules/launch/launch_module.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamentos_module.dart';
import 'package:laserfast_app/app/modules/parceiros/parceiros_module.dart';
import 'package:laserfast_app/app/modules/profile/profile_module.dart';
import 'package:laserfast_app/loading_store.dart';

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
    r.module(
      '/agenda',
      module: AgendaModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/historico',
      module: HistoricoModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/pagamentos',
      module: PagamentoModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/profile',
      module: ProfileModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/parceiros',
      module: ParceirosModule(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      '/faq',
      module: FAQModule(),
      transition: TransitionType.rightToLeft,
    );
  }
}
