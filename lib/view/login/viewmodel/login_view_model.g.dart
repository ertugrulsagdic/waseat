// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isPasswordLockedAtom =
      Atom(name: '_LoginViewModelBase.isPasswordLocked');

  @override
  bool get isPasswordLocked {
    _$isPasswordLockedAtom.reportRead();
    return super.isPasswordLocked;
  }

  @override
  set isPasswordLocked(bool value) {
    _$isPasswordLockedAtom.reportWrite(value, super.isPasswordLocked, () {
      super.isPasswordLocked = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

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

  final _$postLoginAsyncAction = AsyncAction('_LoginViewModelBase.postLogin');

  @override
  Future<void> postLogin() {
    return _$postLoginAsyncAction.run(() => super.postLogin());
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  void isPassworkdLockedChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isPassworkdLockedChange');
    try {
      return super.isPassworkdLockedChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordLocked: ${isPasswordLocked},
isLoading: ${isLoading}
    ''';
  }
}
