import 'dart:async';

import 'package:laserfast_app/app/models/payment.model.dart';
import 'package:laserfast_app/app/shared/interfaces/simple_selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'pagamentos_store.g.dart';

class PagamentosStore = PagamentosStoreBase with _$PagamentosStore;

abstract class PagamentosStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  //====PAGAMENTOS====

  @observable
  ObservableList<SimpleSelectableCard<PaymentModel>> payments =
      ObservableList.of([]);

  @observable
  ObservableList<PaymentModel> selectedPayments = ObservableList.of([]);

  @observable
  bool onlyOpened = false;

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
        price: 365,
        oldPrice: 389.30,
        statusCode: 1,
        discount: 24.3,
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

  //====PAGAMENTO====

  @action
  Future<void> initPagamento() async {}

  @action
  void resetPagamento() {}

  //====PIX====

  final int maxPixDuration = 300;

  late Timer pixTimer;

  @observable
  late int pixDuration = maxPixDuration;

  @observable
  String pixCode = '';

  @action
  Future<void> initPix() async {
    pixTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (pixDuration <= 0) {
        t.cancel();
      } else {
        pixDuration--;
      }
    });

    pixCode = '8sd7784987sde7fsd987sdf7sdf987sdf987sfd';
  }

  @action
  void resetPix() {
    pixTimer.cancel();

    pixDuration = maxPixDuration;
  }

  //====MY-CARDS====

  @action
  Future<void> initMyCards() async {}

  @action
  void resetMyCards() {}

  //====CREDIT-CARD====

  @action
  Future<void> initCreditCard() async {}

  @action
  void resetCreditCard() {}
}
