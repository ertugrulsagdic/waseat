import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/utility/thorottle_helper.dart';
import '../../_product/enum/vehicle_enum.dart';
import '../model/enter_route_map_coordinate_response_model.dart';
import '../model/enter_route_map_response_model.dart';
import '../service/enter_route_map_service.dart';
import '../service/i_enter_route_map_service.dart';
import '../../find_footprint/view/subview/find_footprint_list_view.dart';
import '../../find_footprint/view/subview/find_footprint_map_view.dart';

part 'enter_route_map_view_model.g.dart';

class EnterRouteMapViewModel = _EnterRouteMapViewModelBase
    with _$EnterRouteMapViewModel;

abstract class _EnterRouteMapViewModelBase with Store, BaseViewModel {
  late GoogleMapController controller;

  @observable
  ObservableMap<MarkerId, Marker> markers = ObservableMap.of({});

  TextEditingController? searchController;

  @observable
  LatLng currentPosioton = const LatLng(0, 0);

  @override
  void setContext(BuildContext context) => this.context = context;

  late IEnterRouteMapService enterRouteMapService;
  late ThrottleStringHelper _throttleHelper;

  @observable
  LatLng toPosioton = const LatLng(0, 0);

  @observable
  LatLng currentPosition = const LatLng(0, 0);

  @observable
  LatLng fromPosition = const LatLng(0, 0);

  @observable
  Marker toMarker = const Marker(
    markerId: MarkerId('init'),
  );

  @observable
  Marker fromMarker = const Marker(
    markerId: MarkerId('myLocation'),
  );

  @override
  void init() async {
    enterRouteMapService = EnterRouteMapService(vexanaManager.networkManager);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      currentPosioton = await getCurrentLatLng();
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosioton, zoom: 15),
        ),
      );
    });
    searchController = TextEditingController();
    _throttleHelper = ThrottleStringHelper();
  }

  @observable
  ObservableList<EnterRouteMapResponseModel> places = ObservableList.of([]);

  @action
  Future<List<String>> getPlaces(String text) async {
    places.clear();
    final response = await enterRouteMapService.fetchPlace(text);
    if (response!.type == true) {
      places.addAll(response.data);
      return places.map((element) => element.text).toList();
    } else {
      // showMessage(response);
      return [];
    }
  }

  @observable
  EnterRouteMapCoordinateResponseModel locationToGo =
      EnterRouteMapCoordinateResponseModel();

  void setSelectedLocation(EnterRouteMapCoordinateResponseModel location) {
    print(locationToGo.toJson());
    locationToGo = location;
    print(locationToGo.toJson());
  }

  Future<void> getCoordinates(String selectedString) async {
    // await getPlaces(selectedString);
    EnterRouteMapResponseModel selected =
        places.firstWhere((EnterRouteMapResponseModel option) {
      return option.text.contains(selectedString);
    });
    final response =
        await enterRouteMapService.fetchCoordinate(selected.placeId!);
    if (response!.type == true) {
      setSelectedLocation(
          response.data as EnterRouteMapCoordinateResponseModel);

      final Marker marker = Marker(
        markerId: MarkerId(response.data.address),
        position: LatLng(response.data.lat, response.data.lng),
        infoWindow: InfoWindow(title: selectedString, snippet: '*'),
        onTap: () {
          // _onMarkerTapped(markerId);
        },
      );

      markers = ObservableMap.of({MarkerId(response.data.address): marker});

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(response.data.lat, response.data.lng),
            zoom: 15,
          ),
        ),
      );
    }
  }

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  void setCurrentLocation() async {
    currentPosioton = await getCurrentLatLng();

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosioton, zoom: 15),
      ),
    );
  }

  Future<LatLng> getCurrentLatLng() async {
    final location = await determinePosition();
    return LatLng(location.latitude, location.longitude);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  List<VehicleEnum> vehicles = [
    VehicleEnum.BIKE,
    VehicleEnum.CAR,
    VehicleEnum.TRANSPORTATION,
    VehicleEnum.BICYCLE,
    VehicleEnum.SCOOTER,
  ];
}
