import 'package:laserfast_app/app/apis/auth.api.dart';
import 'package:laserfast_app/app/constants/politica_de_privacidade.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/dados_pessoais.model.dart';
import 'package:laserfast_app/app/models/empty.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  final AuthApi _authApi = AuthApi();

  //==============================================
  //==== PROFILE =================================
  //==============================================

  @action
  Future<void> initProfile() async {}

  @action
  void resetProfile() {}

  //==============================================
  //==== DADOS-PESSOAIS ==========================
  //==============================================

  @observable
  DadosPessoaisModel? dadosPessoaisModel;

  @action
  Future<void> initDadosPessoais() async {
    AuthModel auth = _loginHive.getLogin();

    dadosPessoaisModel = DadosPessoaisModel(
      nome: auth.nome,
      email: auth.email,
      celular: auth.celular,
      cpf: auth.cpf,
    );
  }

  @action
  void resetDadosPessoais() {}

  //==============================================
  //==== CONFIGURAÇÕES ===========================
  //==============================================

  @action
  Future<void> initConfiguracoes() async {}

  @action
  Future<void> logout() async {
    await _loginHive.logout();
  }

  @action
  Future<void> deleteAccount() async {
    await _loginHive.logout();
  }

  @action
  void resetConfiguracoes() {}

  //==============================================
  //==== ENDERECOS ===============================
  //==============================================

  @observable
  String politicaDePrivacidade = '';

  @action
  Future<void> initPoliticasDePrivacidade() async {
    politicaDePrivacidade = politicaDePrivacidadeConst;
  }

  @action
  void resetPoliticasDePrivacidade() {}

  //==============================================
  //==== REDEFINIR-SENHA =========================
  //==============================================

  late final String senhaAtual;

  @action
  Future<void> initRedefinirSenha() async {
    senhaAtual = (_loginHive.getLogin()).senha ?? '';
  }

  @action
  Future<BaseModel<EmptyResponseModel>> redefinirSenha(String senhaNova) async {
    return await _authApi.alterarSenha(senhaAtual, senhaNova);
  }

  @action
  void resetRedefinirSenha() {}
}
