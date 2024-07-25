import 'package:laserfast_app/app/models/session.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'historico_store.g.dart';

class HistoricoStore = HistoricoStoreBase with _$HistoricoStore;

abstract class HistoricoStoreBase with Store {
  //APIS

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //SERVICES

  //OBSERVABLES
  @observable
  ObservableList<SessionModel> history = ObservableList.of([]);

  //VARIABLES

  //COMPUTED

  //ACTIONS
  @action
  Future<void> init() async {
    await getHistory();
  }

  @action
  Future<void> getHistory() async {
    List<SessionModel> sessions = [
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão realizada',
        statusCode: 0,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Falta',
        statusCode: 1,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão agendada',
        statusCode: 2,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão em andamento',
        statusCode: 3,
      ),
      SessionModel(
        applicator: 'Maria Silva',
        date: DateTime.now(),
        areas: 'Perna inteira, Virilha, Buço 10 sessões',
        status: 'Sessão confirmada',
        statusCode: 4,
      ),
    ];

    history.addAll(sessions);
  }

  @action
  void reset() {}

  //METHODS
}
