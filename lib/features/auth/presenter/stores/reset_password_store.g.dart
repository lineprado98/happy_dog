// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetPasswordStore on _ResetPasswordStoreBase, Store {
  late final _$messageErrorAtom =
      Atom(name: '_ResetPasswordStoreBase.messageError', context: context);

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ResetPasswordStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_ResetPasswordStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ResetPasswordStoreBase.resetPassword', context: context);

  @override
  Future<void> resetPassword({required UserCredentialEntity value}) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(value: value));
  }

  late final _$_ResetPasswordStoreBaseActionController =
      ActionController(name: '_ResetPasswordStoreBase', context: context);

  @override
  void setMessageError(String value) {
    final _$actionInfo = _$_ResetPasswordStoreBaseActionController.startAction(
        name: '_ResetPasswordStoreBase.setMessageError');
    try {
      return super.setMessageError(value);
    } finally {
      _$_ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_ResetPasswordStoreBaseActionController.startAction(
        name: '_ResetPasswordStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_ResetPasswordStoreBaseActionController.startAction(
        name: '_ResetPasswordStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageError: ${messageError},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
