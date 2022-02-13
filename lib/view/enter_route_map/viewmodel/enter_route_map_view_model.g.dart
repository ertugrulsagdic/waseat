// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_route_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterRouteMapViewModel on _EnterRouteMapViewModelBase, Store {
  final _$markersAtom = Atom(name: '_EnterRouteMapViewModelBase.markers');

  @override
  ObservableMap<MarkerId, Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableMap<MarkerId, Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

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

  final _$toPosiotonAtom = Atom(name: '_EnterRouteMapViewModelBase.toPosioton');

  @override
  LatLng get toPosioton {
    _$toPosiotonAtom.reportRead();
    return super.toPosioton;
  }

  @override
  set toPosioton(LatLng value) {
    _$toPosiotonAtom.reportWrite(value, super.toPosioton, () {
      super.toPosioton = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_EnterRouteMapViewModelBase.currentPosition');

  @override
  LatLng get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(LatLng value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$fromPositionAtom =
      Atom(name: '_EnterRouteMapViewModelBase.fromPosition');

  @override
  LatLng get fromPosition {
    _$fromPositionAtom.reportRead();
    return super.fromPosition;
  }

  @override
  set fromPosition(LatLng value) {
    _$fromPositionAtom.reportWrite(value, super.fromPosition, () {
      super.fromPosition = value;
    });
  }

  final _$toMarkerAtom = Atom(name: '_EnterRouteMapViewModelBase.toMarker');

  @override
  Marker get toMarker {
    _$toMarkerAtom.reportRead();
    return super.toMarker;
  }

  @override
  set toMarker(Marker value) {
    _$toMarkerAtom.reportWrite(value, super.toMarker, () {
      super.toMarker = value;
    });
  }

  final _$fromMarkerAtom = Atom(name: '_EnterRouteMapViewModelBase.fromMarker');

  @override
  Marker get fromMarker {
    _$fromMarkerAtom.reportRead();
    return super.fromMarker;
  }

  @override
  set fromMarker(Marker value) {
    _$fromMarkerAtom.reportWrite(value, super.fromMarker, () {
      super.fromMarker = value;
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

  final _$locationToGoAtom =
      Atom(name: '_EnterRouteMapViewModelBase.locationToGo');

  @override
  EnterRouteMapCoordinateResponseModel get locationToGo {
    _$locationToGoAtom.reportRead();
    return super.locationToGo;
  }

  @override
  set locationToGo(EnterRouteMapCoordinateResponseModel value) {
    _$locationToGoAtom.reportWrite(value, super.locationToGo, () {
      super.locationToGo = value;
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
  Future<List<String>> getPlaces(String text) {
    return _$getPlacesAsyncAction.run(() => super.getPlaces(text));
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
markers: ${markers},
currentPosioton: ${currentPosioton},
toPosioton: ${toPosioton},
currentPosition: ${currentPosition},
fromPosition: ${fromPosition},
toMarker: ${toMarker},
fromMarker: ${fromMarker},
places: ${places},
locationToGo: ${locationToGo},
isLoading: ${isLoading}
    ''';
  }
}
