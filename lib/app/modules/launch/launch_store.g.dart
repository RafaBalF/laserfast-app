// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LaunchStore on LaunchStoreBase, Store {
  late final _$usingAppForFirstTimeAtom =
      Atom(name: 'LaunchStoreBase.usingAppForFirstTime', context: context);

  @override
  bool get usingAppForFirstTime {
    _$usingAppForFirstTimeAtom.reportRead();
    return super.usingAppForFirstTime;
  }

  @override
  set usingAppForFirstTime(bool value) {
    _$usingAppForFirstTimeAtom.reportWrite(value, super.usingAppForFirstTime,
        () {
      super.usingAppForFirstTime = value;
    });
  }

  late final _$presentationIndexAtom =
      Atom(name: 'LaunchStoreBase.presentationIndex', context: context);

  @override
  int get presentationIndex {
    _$presentationIndexAtom.reportRead();
    return super.presentationIndex;
  }

  @override
  set presentationIndex(int value) {
    _$presentationIndexAtom.reportWrite(value, super.presentationIndex, () {
      super.presentationIndex = value;
    });
  }

  late final _$setHasSeenAppPresentationBeforeAsyncAction = AsyncAction(
      'LaunchStoreBase.setHasSeenAppPresentationBefore',
      context: context);

  @override
  Future<void> setHasSeenAppPresentationBefore() {
    return _$setHasSeenAppPresentationBeforeAsyncAction
        .run(() => super.setHasSeenAppPresentationBefore());
  }

  late final _$LaunchStoreBaseActionController =
      ActionController(name: 'LaunchStoreBase', context: context);

  @override
  void checkShowPresentation() {
    final _$actionInfo = _$LaunchStoreBaseActionController.startAction(
        name: 'LaunchStoreBase.checkShowPresentation');
    try {
      return super.checkShowPresentation();
    } finally {
      _$LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementPresentationIndex({int index = 1}) {
    final _$actionInfo = _$LaunchStoreBaseActionController.startAction(
        name: 'LaunchStoreBase.incrementPresentationIndex');
    try {
      return super.incrementPresentationIndex(index: index);
    } finally {
      _$LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usingAppForFirstTime: ${usingAppForFirstTime},
presentationIndex: ${presentationIndex}
    ''';
  }
}
