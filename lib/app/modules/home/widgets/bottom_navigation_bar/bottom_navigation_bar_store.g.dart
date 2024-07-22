// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_bar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavigationBarStore on BottomNavigationBarStoreBase, Store {
  late final _$selectedIndexAtom = Atom(
      name: 'BottomNavigationBarStoreBase.selectedIndex', context: context);

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

  late final _$BottomNavigationBarStoreBaseActionController =
      ActionController(name: 'BottomNavigationBarStoreBase', context: context);

  @override
  void setSelectedIndex(int i) {
    final _$actionInfo = _$BottomNavigationBarStoreBaseActionController
        .startAction(name: 'BottomNavigationBarStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(i);
    } finally {
      _$BottomNavigationBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
