// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecoverPasswordStore on RecoverPasswordStoreBase, Store {
  late final _$emailAtom =
      Atom(name: 'RecoverPasswordStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$recoverPasswordAsyncAction =
      AsyncAction('RecoverPasswordStoreBase.recoverPassword', context: context);

  @override
  Future<BaseModel<StringResponseModel>> recoverPassword() {
    return _$recoverPasswordAsyncAction.run(() => super.recoverPassword());
  }

  late final _$RecoverPasswordStoreBaseActionController =
      ActionController(name: 'RecoverPasswordStoreBase', context: context);

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$RecoverPasswordStoreBaseActionController.startAction(
        name: 'RecoverPasswordStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$RecoverPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
