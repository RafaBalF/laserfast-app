// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamentos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PagamentosStore on PagamentosStoreBase, Store {
  late final _$paymentsAtom =
      Atom(name: 'PagamentosStoreBase.payments', context: context);

  @override
  ObservableList<SimpleSelectableCard<PaymentModel>> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<SimpleSelectableCard<PaymentModel>> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  late final _$selectedPaymentsAtom =
      Atom(name: 'PagamentosStoreBase.selectedPayments', context: context);

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
      Atom(name: 'PagamentosStoreBase.onlyOpened', context: context);

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
      AsyncAction('PagamentosStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getAllPaymentsAsyncAction =
      AsyncAction('PagamentosStoreBase.getAllPayments', context: context);

  @override
  Future<void> getAllPayments() {
    return _$getAllPaymentsAsyncAction.run(() => super.getAllPayments());
  }

  late final _$initPagamentoAsyncAction =
      AsyncAction('PagamentosStoreBase.initPagamento', context: context);

  @override
  Future<void> initPagamento() {
    return _$initPagamentoAsyncAction.run(() => super.initPagamento());
  }

  late final _$PagamentosStoreBaseActionController =
      ActionController(name: 'PagamentosStoreBase', context: context);

  @override
  void setOnlyOpened(bool b) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setOnlyOpened');
    try {
      return super.setOnlyOpened(b);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPayment(SimpleSelectableCard<PaymentModel> payment) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.selectPayment');
    try {
      return super.selectPayment(payment);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPagamento() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetPagamento');
    try {
      return super.resetPagamento();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
selectedPayments: ${selectedPayments},
onlyOpened: ${onlyOpened}
    ''';
  }
}
