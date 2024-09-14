// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parceiros_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParceirosStore on ParceirosStoreBase, Store {
  late final _$parceirosAtom =
      Atom(name: 'ParceirosStoreBase.parceiros', context: context);

  @override
  ObservableList<ParceiroModel> get parceiros {
    _$parceirosAtom.reportRead();
    return super.parceiros;
  }

  @override
  set parceiros(ObservableList<ParceiroModel> value) {
    _$parceirosAtom.reportWrite(value, super.parceiros, () {
      super.parceiros = value;
    });
  }

  late final _$getParceirosAsyncAction =
      AsyncAction('ParceirosStoreBase.getParceiros', context: context);

  @override
  Future<void> getParceiros() {
    return _$getParceirosAsyncAction.run(() => super.getParceiros());
  }

  @override
  String toString() {
    return '''
parceiros: ${parceiros}
    ''';
  }
}
