// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_footprint_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FindFootprintViewModel on _FindFootprintViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_FindFootprintViewModelBase.isLoading');

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

  final _$selectedTabAtom =
      Atom(name: '_FindFootprintViewModelBase.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$currentPosiotonAtom =
      Atom(name: '_FindFootprintViewModelBase.currentPosioton');

  @override
  LatLng get currentPosioton {
    _$currentPosiotonAtom.reportRead();
    return super.currentPosioton;
  }

  @override
  set currentPosioton(LatLng value) {
    _$currentPosiotonAtom.reportWrite(value, super.currentPosioton, () {
      super.currentPosioton = value;
    });
  }

  final _$_FindFootprintViewModelBaseActionController =
      ActionController(name: '_FindFootprintViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_FindFootprintViewModelBaseActionController
        .startAction(name: '_FindFootprintViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_FindFootprintViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedTab: ${selectedTab},
currentPosioton: ${currentPosioton}
    ''';
  }
}
