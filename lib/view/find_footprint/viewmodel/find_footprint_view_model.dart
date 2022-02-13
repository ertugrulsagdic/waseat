import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/core/base/viewmodel/base_view_model.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';
import 'package:waseat/view/find_footprint/view/subview/find_footprint_map_view.dart';
part 'find_footprint_view_model.g.dart';

class FindFootprintViewModel = _FindFootprintViewModelBase
    with _$FindFootprintViewModel;

abstract class _FindFootprintViewModelBase with Store, BaseViewModel {
  late GoogleMapController controller;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      currentPosioton = await getCurrentLatLng();
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosioton, zoom: 15),
        ),
      );
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

  @observable
  LatLng currentPosioton = const LatLng(0, 0);

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
}
