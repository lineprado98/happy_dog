// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckUserStore on _CheckUserStoreBase, Store {
  late final _$messageErrorAtom =
      Atom(name: '_CheckUserStoreBase.messageError', context: context);

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

  late final _$isLoggedAtom =
      Atom(name: '_CheckUserStoreBase.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_CheckUserStoreBase.isError', context: context);

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

  late final _$checkUserIsLoggedAsyncAction =
      AsyncAction('_CheckUserStoreBase.checkUserIsLogged', context: context);

  @override
  Future<void> checkUserIsLogged() {
    return _$checkUserIsLoggedAsyncAction.run(() => super.checkUserIsLogged());
  }

  late final _$_CheckUserStoreBaseActionController =
      ActionController(name: '_CheckUserStoreBase', context: context);

  @override
  void setMessageError(String value) {
    final _$actionInfo = _$_CheckUserStoreBaseActionController.startAction(
        name: '_CheckUserStoreBase.setMessageError');
    try {
      return super.setMessageError(value);
    } finally {
      _$_CheckUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLogged(bool value) {
    final _$actionInfo = _$_CheckUserStoreBaseActionController.startAction(
        name: '_CheckUserStoreBase.setIsLogged');
    try {
      return super.setIsLogged(value);
    } finally {
      _$_CheckUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_CheckUserStoreBaseActionController.startAction(
        name: '_CheckUserStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_CheckUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageError: ${messageError},
isLogged: ${isLogged},
isError: ${isError}
    ''';
  }
}
