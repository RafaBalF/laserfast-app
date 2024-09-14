import 'package:laserfast_app/app/apis/parceiro.api.dart';
import 'package:laserfast_app/app/models/parceiro.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'parceiros_store.g.dart';

class ParceirosStore = ParceirosStoreBase with _$ParceirosStore;

abstract class ParceirosStoreBase with Store {
  final ParceiroApi _parceiroApi = ParceiroApi();

  final LoadingStore loadingStore = LoadingStore();

  @observable
  ObservableList<ParceiroModel> parceiros = ObservableList.of([]);

  @action
  Future<void> getParceiros() async {
    final r = await _parceiroApi.parceiros();

    if (!r.success) return;

    parceiros.addAll(r.list!);
  }
}
