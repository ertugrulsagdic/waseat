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

  final _$placesAtom = Atom(name: '_EnterRouteMapViewModelBase.places');

  @override
  ObservableList<EnterRouteMapResponseModel> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(ObservableList<EnterRouteMapResponseModel> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
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

  final _$getPlacesAsyncAction =
      AsyncAction('_EnterRouteMapViewModelBase.getPlaces');

  @override
  Future<Iterable<dynamic>?> getPlaces(String text) {
    return _$getPlacesAsyncAction.run(() => super.getPlaces(text));
  }

  final _$_EnterRouteMapViewModelBaseActionController =
      ActionController(name: '_EnterRouteMapViewModelBase');

  @override
  ObservableList<EnterRouteMapResponseModel> returnList(String value) {
    final _$actionInfo = _$_EnterRouteMapViewModelBaseActionController
        .startAction(name: '_EnterRouteMapViewModelBase.returnList');
    try {
      return super.returnList(value);
    } finally {
      _$_EnterRouteMapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
places: ${places},
isLoading: ${isLoading}
    ''';
  }
}
