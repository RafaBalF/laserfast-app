import 'package:laserfast_app/app/apis/notificacao.api.dart';
import 'package:laserfast_app/app/models/notificacao.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'notificacoes_store.g.dart';

class NotificacoesStore = NotificacoesStoreBase with _$NotificacoesStore;

abstract class NotificacoesStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final NotificacaoApi _notificacaoApi = NotificacaoApi();

  @observable
  ObservableList<NotificacaoModel> notificacoes = ObservableList.of([]);

  @action
  Future<void> init() async {
    await getNotificacoes();
  }

  @action
  Future<void> getNotificacoes() async {
    notificacoes.clear();
    final r = await _notificacaoApi.listaNotificacoes();

    if (!r.success) return;

    notificacoes.addAll(r.list!);
  }

  @action
  void reset() {
    notificacoes.clear();
  }
}
