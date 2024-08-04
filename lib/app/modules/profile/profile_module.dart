import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/profile/pages/dados_pessoais_page.dart';
import 'package:laserfast_app/app/modules/profile/pages/parceiros_page.dart';
import 'package:laserfast_app/app/modules/profile/profile_page.dart';
import 'package:laserfast_app/app/modules/profile/profile_store.dart';

class ProfileModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(ProfileStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfilePage());
    r.child('/dados-pessoais', child: (context) => const DadosPessoaisPage());
    r.child('/enderecos', child: (context) => const DadosPessoaisPage());
    r.child('/parceiros', child: (context) => const ParceirosPage());
  }
}
