import 'package:laserfast_app/app/models/payment.model.dart';
import 'package:laserfast_app/app/shared/interfaces/simple_selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'pagamentos_store.g.dart';

class PagamentosStore = PagamentoStoreBase with _$PagamentosStore;

abstract class PagamentoStoreBase with Store {
  //APIS

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //SERVICES

  //OBSERVABLES
  @observable
  ObservableList<SimpleSelectableCard<PaymentModel>> payments =
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
    List<PaymentModel> list = [
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
        price: 389.30,
        oldPrice: 365,
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

    for (var payment in list) {
      payments.add(SimpleSelectableCard<PaymentModel>(value: payment));
    }
  }

  @action
  void setOnlyOpened(bool b) => onlyOpened = b;

  @action
  void selectPayment(SimpleSelectableCard<PaymentModel> payment) {
    int index = payments.indexWhere((p) => p.value.id == payment.value.id);

    var model = SimpleSelectableCard<PaymentModel>(
      value: payment.value,
      selected: !payment.selected,
    );

    payments[index] = model;

    (selectedPayments.contains(model.value))
        ? selectedPayments.remove(model.value)
        : selectedPayments.add(model.value);
  }

  @action
  void reset() {}

  //METHODS
}
