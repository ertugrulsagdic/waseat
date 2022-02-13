import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/core/base/viewmodel/base_view_model.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_coordinate_response_model.dart';
import 'package:waseat/view/find_footprint/model/find_footprint_response_model.dart';
import 'package:waseat/view/find_footprint/service/find_footprint_service.dart';
import 'package:waseat/view/find_footprint/service/i_find_footprint_service.dart';
import 'package:waseat/view/find_footprint/view/subview/find_footprint_map_view.dart';
part 'find_footprint_view_model.g.dart';

class FindFootprintViewModel = _FindFootprintViewModelBase
    with _$FindFootprintViewModel;

abstract class _FindFootprintViewModelBase with Store, BaseViewModel {
  late GoogleMapController controller;

  final EnterRouteMapCoordinateResponseModel coordinateModel;

  _FindFootprintViewModelBase(this.coordinateModel);

  late TextEditingController fromController;
  late TextEditingController toController;

  late IFindFootprintService footprintService;

  @observable
  ObservableMap<MarkerId, Marker> markers = ObservableMap.of({});

  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  LatLng toPosioton = const LatLng(0, 0);

  @observable
  LatLng currentPosition = const LatLng(0, 0);

  @observable
  LatLng fromPosition = const LatLng(0, 0);

  @override
  void init() {
    fromController = TextEditingController();
    toController = TextEditingController();
    footprintService = FindFootprintService(vexanaManager.networkManager);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (coordinateModel != null) {
        print(coordinateModel.toJson());
        inspect(coordinateModel.toJson());
        toMarker = Marker(
          markerId: MarkerId(coordinateModel.address!),
          position: LatLng(coordinateModel.lat!, coordinateModel.lng!),
          infoWindow: InfoWindow(title: coordinateModel.address, snippet: '*'),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
        toPosioton = LatLng(coordinateModel.lat!, coordinateModel.lng!);
        fromPosition = await getCurrentLatLng();

        toController.text = coordinateModel.address!;
        fromController.text = 'My Location';

        fromMarker = Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(fromPosition.latitude, fromPosition.longitude),
          infoWindow: const InfoWindow(title: 'My Location', snippet: '*'),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
      } else {
        fromPosition = await getCurrentLatLng();

        fromMarker = Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(fromPosition.latitude, fromPosition.longitude),
          infoWindow: const InfoWindow(title: 'My Location', snippet: '*'),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
      }

      markers = ObservableMap.of({
        fromMarker.markerId: fromMarker,
        toMarker.markerId: toMarker,
      });
    });
  }

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @observable
  int selectedTab = 0;

  void changeSelectedTab(int value) {
    selectedTab = value;
  }

  @observable
  int page = 0;

  void changePage(int value) {
    page = value;
  }

  List<SearchTabEnum> tabs = [
    SearchTabEnum.FOOT,
    SearchTabEnum.BIKE,
    SearchTabEnum.CAR,
    SearchTabEnum.TRANSPORTATION,
    SearchTabEnum.BICYCLE,
    SearchTabEnum.SCOOTER,
  ];

  void setCurrentLocation() async {
    currentPosition = await getCurrentLatLng();

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition, zoom: 15),
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

  @observable
  ObservableList<FindFootPrintResponseModel> toPlaces = ObservableList.of([]);
  ObservableList<FindFootPrintResponseModel> fromPlaces = ObservableList.of([]);

  @action
  Future<List<String>> getPlaces(String text, bool isFrom) async {
    isFrom ? fromPlaces.clear() : toPlaces.clear();
    final response = await footprintService.fetchPlace(text);
    if (response!.type == true) {
      isFrom
          ? fromPlaces.addAll(response.data)
          : toPlaces.addAll(response.data);

      return isFrom
          ? fromPlaces.map((element) => element.text).toList()
          : toPlaces.map((element) => element.text).toList();
    } else {
      // showMessage(response);
      return [];
    }
  }

  @observable
  Marker toMarker = const Marker(
    markerId: MarkerId('init'),
  );

  @observable
  Marker fromMarker = const Marker(
    markerId: MarkerId('myLocation'),
  );

  Future<void> getCoordinates(String selectedString, bool isFrom) async {
    // await getPlaces(selectedString);
    FindFootPrintResponseModel selected = isFrom
        ? fromPlaces.firstWhere((FindFootPrintResponseModel option) {
            return option.text.contains(selectedString);
          })
        : toPlaces.firstWhere((FindFootPrintResponseModel option) {
            return option.text.contains(selectedString);
          });
    final response = await footprintService.fetchCoordinate(selected.placeId!);
    if (response!.type == true) {
      if (isFrom) {
        fromMarker = Marker(
          markerId: MarkerId(response.data.address),
          position: LatLng(response.data.lat, response.data.lng),
          infoWindow: InfoWindow(title: selectedString, snippet: '*'),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
      } else {
        toMarker = Marker(
          markerId: MarkerId(response.data.address),
          position: LatLng(response.data.lat, response.data.lng),
          infoWindow: InfoWindow(title: selectedString, snippet: '*'),
          onTap: () {
            // _onMarkerTapped(markerId);
          },
        );
      }

      markers = ObservableMap.of({
        fromMarker.markerId: fromMarker,
        toMarker.markerId: toMarker,
      });

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
}
