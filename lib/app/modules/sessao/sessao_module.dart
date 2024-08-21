import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/constants/transition_type.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/agendamento_page.dart';
import 'package:laserfast_app/app/modules/sessao/avaliar/avaliar_page.dart';
import 'package:laserfast_app/app/modules/sessao/check_in/check_in_page.dart';
import 'package:laserfast_app/app/modules/sessao/historico/historico_page.dart';
import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';

class SessaoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SessaoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HistoricoPage());
    r.child('/historico', child: (context) => const HistoricoPage());
    r.child(
      '/agendamento',
      child: (context) => AgendamentoPage(sessionId: r.args.data),
      transition: defaultTransitonType,
    );
    r.child('/avaliar', child: (context) => const AvaliarPage());
    r.child('/check_in', child: (context) => const CheckInPage());
    // r.child('/contratos', child: (context) => const ContratosPage());
  }
}
