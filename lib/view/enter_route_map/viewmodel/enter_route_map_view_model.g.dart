// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_route_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterRouteMapViewModel on _EnterRouteMapViewModelBase, Store {
  final _$currentPosiotonAtom =
      Atom(name: '_EnterRouteMapViewModelBase.currentPosioton');

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

  final _$polylineCoordinatesAtom =
      Atom(name: '_EnterRouteMapViewModelBase.polylineCoordinates');

  @override
  ObservableList<LatLng> get polylineCoordinates {
    _$polylineCoordinatesAtom.reportRead();
    return super.polylineCoordinates;
  }

  @override
  set polylineCoordinates(ObservableList<LatLng> value) {
    _$polylineCoordinatesAtom.reportWrite(value, super.polylineCoordinates, () {
      super.polylineCoordinates = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EnterRouteMapViewModelBase.isLoading');

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

  final _$_EnterRouteMapViewModelBaseActionController =
      ActionController(name: '_EnterRouteMapViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_EnterRouteMapViewModelBaseActionController
        .startAction(name: '_EnterRouteMapViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_EnterRouteMapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPosioton: ${currentPosioton},
polylineCoordinates: ${polylineCoordinates},
isLoading: ${isLoading}
    ''';
  }
}
