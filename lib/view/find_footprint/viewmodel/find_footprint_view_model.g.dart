// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_footprint_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FindFootprintViewModel on _FindFootprintViewModelBase, Store {
  final _$markersAtom = Atom(name: '_FindFootprintViewModelBase.markers');

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

  final _$toPosiotonAtom = Atom(name: '_FindFootprintViewModelBase.toPosioton');

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
      Atom(name: '_FindFootprintViewModelBase.currentPosition');

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
      Atom(name: '_FindFootprintViewModelBase.fromPosition');

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

  final _$pageAtom = Atom(name: '_FindFootprintViewModelBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$toPlacesAtom = Atom(name: '_FindFootprintViewModelBase.toPlaces');

  @override
  ObservableList<FindFootPrintResponseModel> get toPlaces {
    _$toPlacesAtom.reportRead();
    return super.toPlaces;
  }

  @override
  set toPlaces(ObservableList<FindFootPrintResponseModel> value) {
    _$toPlacesAtom.reportWrite(value, super.toPlaces, () {
      super.toPlaces = value;
    });
  }

  final _$toMarkerAtom = Atom(name: '_FindFootprintViewModelBase.toMarker');

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

  final _$fromMarkerAtom = Atom(name: '_FindFootprintViewModelBase.fromMarker');

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

  final _$routeInfoAtom = Atom(name: '_FindFootprintViewModelBase.routeInfo');

  @override
  FindFootprintRouteResponseModel get routeInfo {
    _$routeInfoAtom.reportRead();
    return super.routeInfo;
  }

  @override
  set routeInfo(FindFootprintRouteResponseModel value) {
    _$routeInfoAtom.reportWrite(value, super.routeInfo, () {
      super.routeInfo = value;
    });
  }

  final _$polylinesAtom = Atom(name: '_FindFootprintViewModelBase.polylines');

  @override
  ObservableMap<PolylineId, Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(ObservableMap<PolylineId, Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  final _$polylineCoordinatesAtom =
      Atom(name: '_FindFootprintViewModelBase.polylineCoordinates');

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

  final _$getPlacesAsyncAction =
      AsyncAction('_FindFootprintViewModelBase.getPlaces');

  @override
  Future<List<String>> getPlaces(String text, bool isFrom) {
    return _$getPlacesAsyncAction.run(() => super.getPlaces(text, isFrom));
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
markers: ${markers},
toPosioton: ${toPosioton},
currentPosition: ${currentPosition},
fromPosition: ${fromPosition},
isLoading: ${isLoading},
selectedTab: ${selectedTab},
page: ${page},
toPlaces: ${toPlaces},
toMarker: ${toMarker},
fromMarker: ${fromMarker},
routeInfo: ${routeInfo},
polylines: ${polylines},
polylineCoordinates: ${polylineCoordinates}
    ''';
  }
}
