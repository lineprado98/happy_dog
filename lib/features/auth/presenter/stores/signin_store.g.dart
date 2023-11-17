// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on _SigninStoreBase, Store {
  late final _$messageErrorAtom =
      Atom(name: '_SigninStoreBase.messageError', context: context);

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
      Atom(name: '_SigninStoreBase.isLoading', context: context);

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
      Atom(name: '_SigninStoreBase.isError', context: context);

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

  late final _$_SigninStoreBaseActionController =
      ActionController(name: '_SigninStoreBase', context: context);

  @override
  void setMessageError(String value) {
    final _$actionInfo = _$_SigninStoreBaseActionController.startAction(
        name: '_SigninStoreBase.setMessageError');
    try {
      return super.setMessageError(value);
    } finally {
      _$_SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_SigninStoreBaseActionController.startAction(
        name: '_SigninStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_SigninStoreBaseActionController.startAction(
        name: '_SigninStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_SigninStoreBaseActionController.endAction(_$actionInfo);
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
