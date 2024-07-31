// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PagamentoStore on PagamentoStoreBase, Store {
  late final _$allPaymentsAtom =
      Atom(name: 'PagamentoStoreBase.allPayments', context: context);

  @override
  ObservableList<SimpleSelectableCard<PaymentModel>> get allPayments {
    _$allPaymentsAtom.reportRead();
    return super.allPayments;
  }

  @override
  set allPayments(ObservableList<SimpleSelectableCard<PaymentModel>> value) {
    _$allPaymentsAtom.reportWrite(value, super.allPayments, () {
      super.allPayments = value;
    });
  }

  late final _$displayedPaymentsAtom =
      Atom(name: 'PagamentoStoreBase.displayedPayments', context: context);

  @override
  ObservableList<SimpleSelectableCard<PaymentModel>> get displayedPayments {
    _$displayedPaymentsAtom.reportRead();
    return super.displayedPayments;
  }

  @override
  set displayedPayments(
      ObservableList<SimpleSelectableCard<PaymentModel>> value) {
    _$displayedPaymentsAtom.reportWrite(value, super.displayedPayments, () {
      super.displayedPayments = value;
    });
  }

  late final _$selectedPaymentsAtom =
      Atom(name: 'PagamentoStoreBase.selectedPayments', context: context);

  @override
  ObservableList<PaymentModel> get selectedPayments {
    _$selectedPaymentsAtom.reportRead();
    return super.selectedPayments;
  }

  @override
  set selectedPayments(ObservableList<PaymentModel> value) {
    _$selectedPaymentsAtom.reportWrite(value, super.selectedPayments, () {
      super.selectedPayments = value;
    });
  }

  late final _$onlyOpenedAtom =
      Atom(name: 'PagamentoStoreBase.onlyOpened', context: context);

  @override
  bool get onlyOpened {
    _$onlyOpenedAtom.reportRead();
    return super.onlyOpened;
  }

  @override
  set onlyOpened(bool value) {
    _$onlyOpenedAtom.reportWrite(value, super.onlyOpened, () {
      super.onlyOpened = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PagamentoStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getAllPaymentsAsyncAction =
      AsyncAction('PagamentoStoreBase.getAllPayments', context: context);

  @override
  Future<void> getAllPayments() {
    return _$getAllPaymentsAsyncAction.run(() => super.getAllPayments());
  }

  late final _$PagamentoStoreBaseActionController =
      ActionController(name: 'PagamentoStoreBase', context: context);

  @override
  void setOnlyOpened(bool b) {
    final _$actionInfo = _$PagamentoStoreBaseActionController.startAction(
        name: 'PagamentoStoreBase.setOnlyOpened');
    try {
      return super.setOnlyOpened(b);
    } finally {
      _$PagamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPayment(PaymentModel payment) {
    final _$actionInfo = _$PagamentoStoreBaseActionController.startAction(
        name: 'PagamentoStoreBase.selectPayment');
    try {
      return super.selectPayment(payment);
    } finally {
      _$PagamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$PagamentoStoreBaseActionController.startAction(
        name: 'PagamentoStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$PagamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allPayments: ${allPayments},
displayedPayments: ${displayedPayments},
selectedPayments: ${selectedPayments},
onlyOpened: ${onlyOpened}
    ''';
  }
}
