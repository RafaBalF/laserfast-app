import 'package:laserfast_app/app/models/payment.model.dart';
import 'package:laserfast_app/app/shared/interfaces/simple_selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'pagamento_store.g.dart';

class PagamentoStore = PagamentoStoreBase with _$PagamentoStore;

abstract class PagamentoStoreBase with Store {
  //APIS

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //SERVICES

  //OBSERVABLES
  @observable
  ObservableList<SimpleSelectableCard<PaymentModel>> allPayments =
      ObservableList.of([]);

  @observable
  ObservableList<SimpleSelectableCard<PaymentModel>> displayedPayments =
      ObservableList.of([]);

  @observable
  ObservableList<PaymentModel> selectedPayments = ObservableList.of([]);

  @observable
  bool onlyOpened = false;

  //VARIABLES

  //COMPUTED

  //ACTIONS
  @action
  Future<void> init() async {
    await getAllPayments();
  }

  @action
  Future<void> getAllPayments() async {
    List<PaymentModel> payments = [
      PaymentModel(
        id: 1,
        parcela: "1/10",
        date: DateTime.now(),
        price: 315,
        oldPrice: null,
        statusCode: 0,
      ),
      PaymentModel(
        id: 2,
        parcela: null,
        date: DateTime.now(),
        price: 315,
        oldPrice: null,
        statusCode: 1,
      ),
      PaymentModel(
        id: 3,
        parcela: null,
        date: DateTime.now(),
        price: 315,
        oldPrice: null,
        statusCode: 2,
      ),
    ];

    for (var payment in payments) {
      allPayments.add(SimpleSelectableCard<PaymentModel>(value: payment));
      displayedPayments.add(SimpleSelectableCard<PaymentModel>(value: payment));
    }

    displayedPayments;
  }

  @action
  void setOnlyOpened(bool b) {
    onlyOpened = b;

    displayedPayments.clear();

    displayedPayments.addAll((b)
        ? allPayments.toList().where((p) => p.value.statusCode != 0)
        : allPayments.toList());
  }

  @action
  void selectPayment(PaymentModel payment) {
    displayedPayments.where((p) => p.value.id == payment.id).first.selected =
        true;

    // if (selectedPayments.contains(model.value)) {
    //   selectedPayments.remove(model.value);
    //   model.selected = false;
    // } else {
    //   selectedPayments.add(model.value);
    //   model.selected = true;
    // }
  }

  @action
  void reset() {}

  //METHODS
}
