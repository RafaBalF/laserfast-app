import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/agenda/agenda_module.dart';
import 'package:laserfast_app/app/modules/auth/auth_module.dart';
import 'package:laserfast_app/app/modules/historico/historico_module.dart';
import 'package:laserfast_app/app/modules/home/home_module.dart';
import 'package:laserfast_app/app/modules/launch/launch_module.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamento_module.dart';
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
      '/pagamento',
      module: PagamentoModule(),
      transition: TransitionType.rightToLeft,
    );
  }
}
