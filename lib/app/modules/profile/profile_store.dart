import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/dados_pessoais.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  //==============================================
  //==== PROFILE =================================
  //==============================================

  @action
  Future<void> initProfile() async {}

  @action
  Future<void> resetProfile() async {}

  //==============================================
  //==== DADOS-PESSOAIS ==========================
  //==============================================

  @observable
  DadosPessoaisModel? dadosPessoaisModel;

  @action
  Future<void> initDadosPessoais() async {
    AuthModel auth = _loginHive.getLogin();

    dadosPessoaisModel = DadosPessoaisModel(
      nome: auth.name ?? 'Leonardo Polo',
      email: auth.email ?? 'leonardo.polo@gmail.com',
      celular: auth.celular ?? '17998982144',
      cpf: auth.cpf ?? '33365500000',
    );
  }

  @action
  Future<void> resetDadosPessoais() async {}

  //==============================================
  //==== ENDERECOS ===============================
  //==============================================

  @action
  Future<void> initEnderecos() async {}

  @action
  Future<void> resetEnderecos() async {}

  //==============================================
  //==== PARCEIROS ===============================
  //==============================================

  @action
  Future<void> initParceiros() async {}

  @action
  Future<void> resetParceiros() async {}
}
