import 'package:laserfast_app/app/apis/perguntas_respostas.api.dart';
import 'package:laserfast_app/app/models/perguntas_respostas.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'faq_store.g.dart';

class FAQStore = FAQStoreBase with _$FAQStore;

abstract class FAQStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  final PerguntasRespostasApi _perguntasRespostasApi = PerguntasRespostasApi();

  @observable
  ObservableList<PerguntasRespostasModel> perguntasRespostas =
      ObservableList.of([]);

  @action
  Future<void> getPerguntasRespostas() async {
    final r = await _perguntasRespostasApi.perguntasRespostas();

    if (!r.success) return;

    perguntasRespostas.addAll(r.list!);
  }

  @action
  void reset() {}
}
