// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: 'HomeStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$cashbackAtom =
      Atom(name: 'HomeStoreBase.cashback', context: context);

  @override
  double get cashback {
    _$cashbackAtom.reportRead();
    return super.cashback;
  }

  @override
  set cashback(double value) {
    _$cashbackAtom.reportWrite(value, super.cashback, () {
      super.cashback = value;
    });
  }

  late final _$bannersVerticaisAtom =
      Atom(name: 'HomeStoreBase.bannersVerticais', context: context);

  @override
  ObservableList<BannerVerticalModel> get bannersVerticais {
    _$bannersVerticaisAtom.reportRead();
    return super.bannersVerticais;
  }

  @override
  set bannersVerticais(ObservableList<BannerVerticalModel> value) {
    _$bannersVerticaisAtom.reportWrite(value, super.bannersVerticais, () {
      super.bannersVerticais = value;
    });
  }

  late final _$maisDesejadosAtom =
      Atom(name: 'HomeStoreBase.maisDesejados', context: context);

  @override
  ObservableList<MaisDesejadoModel> get maisDesejados {
    _$maisDesejadosAtom.reportRead();
    return super.maisDesejados;
  }

  @override
  set maisDesejados(ObservableList<MaisDesejadoModel> value) {
    _$maisDesejadosAtom.reportWrite(value, super.maisDesejados, () {
      super.maisDesejados = value;
    });
  }

  late final _$getCashbackAsyncAction =
      AsyncAction('HomeStoreBase.getCashback', context: context);

  @override
  Future<void> getCashback() {
    return _$getCashbackAsyncAction.run(() => super.getCashback());
  }

  late final _$getBannersVerticaisAsyncAction =
      AsyncAction('HomeStoreBase.getBannersVerticais', context: context);

  @override
  Future<void> getBannersVerticais() {
    return _$getBannersVerticaisAsyncAction
        .run(() => super.getBannersVerticais());
  }

  late final _$getMaisDesejadosAsyncAction =
      AsyncAction('HomeStoreBase.getMaisDesejados', context: context);

  @override
  Future<void> getMaisDesejados() {
    return _$getMaisDesejadosAsyncAction.run(() => super.getMaisDesejados());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setSelectedIndex(int i) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(i);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
cashback: ${cashback},
bannersVerticais: ${bannersVerticais},
maisDesejados: ${maisDesejados}
    ''';
  }
}
