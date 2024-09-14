// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FAQStore on FAQStoreBase, Store {
  late final _$perguntasRespostasAtom =
      Atom(name: 'FAQStoreBase.perguntasRespostas', context: context);

  @override
  ObservableList<PerguntasRespostasModel> get perguntasRespostas {
    _$perguntasRespostasAtom.reportRead();
    return super.perguntasRespostas;
  }

  @override
  set perguntasRespostas(ObservableList<PerguntasRespostasModel> value) {
    _$perguntasRespostasAtom.reportWrite(value, super.perguntasRespostas, () {
      super.perguntasRespostas = value;
    });
  }

  late final _$getPerguntasRespostasAsyncAction =
      AsyncAction('FAQStoreBase.getPerguntasRespostas', context: context);

  @override
  Future<void> getPerguntasRespostas() {
    return _$getPerguntasRespostasAsyncAction
        .run(() => super.getPerguntasRespostas());
  }

  late final _$FAQStoreBaseActionController =
      ActionController(name: 'FAQStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo =
        _$FAQStoreBaseActionController.startAction(name: 'FAQStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$FAQStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
perguntasRespostas: ${perguntasRespostas}
    ''';
  }
}
