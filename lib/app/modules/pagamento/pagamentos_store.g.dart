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

  late final _$pixDurationAtom =
      Atom(name: 'PagamentosStoreBase.pixDuration', context: context);

  @override
  int get pixDuration {
    _$pixDurationAtom.reportRead();
    return super.pixDuration;
  }

  bool _pixDurationIsInitialized = false;

  @override
  set pixDuration(int value) {
    _$pixDurationAtom.reportWrite(
        value, _pixDurationIsInitialized ? super.pixDuration : null, () {
      super.pixDuration = value;
      _pixDurationIsInitialized = true;
    });
  }

  late final _$pixCodeAtom =
      Atom(name: 'PagamentosStoreBase.pixCode', context: context);

  @override
  String get pixCode {
    _$pixCodeAtom.reportRead();
    return super.pixCode;
  }

  @override
  set pixCode(String value) {
    _$pixCodeAtom.reportWrite(value, super.pixCode, () {
      super.pixCode = value;
    });
  }

  late final _$cardsAtom =
      Atom(name: 'PagamentosStoreBase.cards', context: context);

  @override
  ObservableList<CreditCardModel> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<CreditCardModel> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
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

  late final _$initPixAsyncAction =
      AsyncAction('PagamentosStoreBase.initPix', context: context);

  @override
  Future<void> initPix() {
    return _$initPixAsyncAction.run(() => super.initPix());
  }

  late final _$initMyCardsAsyncAction =
      AsyncAction('PagamentosStoreBase.initMyCards', context: context);

  @override
  Future<void> initMyCards() {
    return _$initMyCardsAsyncAction.run(() => super.initMyCards());
  }

  late final _$initCreditCardAsyncAction =
      AsyncAction('PagamentosStoreBase.initCreditCard', context: context);

  @override
  Future<void> initCreditCard() {
    return _$initCreditCardAsyncAction.run(() => super.initCreditCard());
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
  void resetPix() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetPix');
    try {
      return super.resetPix();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetMyCards() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetMyCards');
    try {
      return super.resetMyCards();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCreditCard() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetCreditCard');
    try {
      return super.resetCreditCard();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
selectedPayments: ${selectedPayments},
onlyOpened: ${onlyOpened},
pixDuration: ${pixDuration},
pixCode: ${pixCode},
cards: ${cards}
    ''';
  }
}
