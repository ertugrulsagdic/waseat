// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_tab_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomTabViewModel on _BottomTabViewModelBase, Store {
  final _$tabIndexAtom = Atom(name: '_BottomTabViewModelBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$_BottomTabViewModelBaseActionController =
      ActionController(name: '_BottomTabViewModelBase');

  @override
  void changeTabIndex(dynamic index) {
    final _$actionInfo = _$_BottomTabViewModelBaseActionController.startAction(
        name: '_BottomTabViewModelBase.changeTabIndex');
    try {
      return super.changeTabIndex(index);
    } finally {
      _$_BottomTabViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex}
    ''';
  }
}
