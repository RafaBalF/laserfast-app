import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:laserfast_app/app/models/indicado.model.dart';
import 'package:laserfast_app/app/models/string_response.model.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'indicar_store.g.dart';

class IndicarStore = IndicarStoreBase with _$IndicarStore;

abstract class IndicarStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  late final String userEmail;

  @observable
  ObservableList<IndicadoModel> indicados = ObservableList.of([]);

  @action
  Future<void> init() async {
    userEmail = (_loginHive.getLogin()).email ?? '';
  }

  @action
  Future<BaseModel<StringResponseModel>> indicar(IndicadoModel indicado) async {
    var b = BaseModel<StringResponseModel>();

    if (indicado.email == userEmail) {
      b.message = 'Você não pode se indicar';
      return b;
    }

    final msmEmail =
        indicados.where((i) => i.email!.toLowerCase() == indicado.email);

    if (msmEmail.isNotEmpty) {
      b.message = 'Essa pessoa já foi indicada';
      return b;
    }

    indicado.indicadoEm = DateTime.now();
    indicados.add(indicado);
    b.success = true;

    return b;
  }

  @action
  void reset() {
    indicados.clear();
  }
}
