import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/core/constants/navigation/navigation_constants.dart';
import 'package:waseat/core/init/lang/locale_keys.g.dart';
import 'package:waseat/view/_product/search_input.dart';
import 'package:waseat/view/find_footprint/view/find_footprint_view.dart';

import '../../_product/enum/vehicle_enum.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/enter_route_map_view_model.dart';

class EnterRouteMapView extends StatelessWidget {
  const EnterRouteMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EnterRouteMapViewModel>(
      viewModel: EnterRouteMapViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, EnterRouteMapViewModel viewModel) =>
          Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.6),
              child: _mapBox(context, viewModel),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _myLocation(context, viewModel),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: context.colorScheme.surface,
                    ),
                    height: context.dynamicHeight(0.3),
                    child: _bottomBox(context, viewModel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Haritalar
  Widget _mapBox(BuildContext context, EnterRouteMapViewModel viewModel) =>
      Observer(builder: (_) {
        return GoogleMap(
          // polylines: Set<Polyline>.of(viewModel.polylines.values),
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: viewModel.currentPosioton,
            zoom: 5,
          ),
          // markers: Set<Marker>.of(viewModel.markers!.values),
          zoomGesturesEnabled: true,
          onMapCreated: (GoogleMapController controller) =>
              viewModel.controller = controller,
          myLocationEnabled: true,
          compassEnabled: true,
          trafficEnabled: true,
          myLocationButtonEnabled: false,
        );
      });

  // Alt arama kısmı
  Widget _bottomBox(BuildContext context, EnterRouteMapViewModel viewModel) =>
      SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.dynamicWidth(0.025)),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: context.dynamicWidth(0.2),
                  maxHeight: context.dynamicWidth(0.015),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.dynamicWidth(1)),
                  ),
                ),
              ),
            ),
            // Konuma götür
            // Arama
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.normalValue,
                    right: context.normalValue,
                    top: context.lowValue,
                  ),
                  child: SearchInput(
                    onTap: () {
                      viewModel.navigation.navigateToPage(
                          path: NavigationConstants.FIND_FOOTPRINT);
                    },
                    filterIcon: true,
                    searchController: viewModel.searchController,
                    onChanged: (value) {
                      // viewModel.setSearchList(value);sd
                    },
                  ),
                ),
                SizedBox(height: context.normalValue),
                Padding(
                  padding: EdgeInsets.only(left: context.normalValue),
                  child: Text(
                    LocaleKeys.map_allVehicles.tr(),
                  ),
                ),
                SizedBox(height: context.normalValue),
                Container(
                  padding: EdgeInsets.only(left: context.normalValue),
                  height: context.dynamicHeight(0.15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.vehicles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: context.normalValue),
                          child: Column(
                            children: [
                              Container(
                                width: context.dynamicWidth(0.15),
                                height: context.dynamicWidth(0.15),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.onPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  viewModel.vehicles[index].index.vehicleIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: context.normalValue),
                              SizedBox(
                                width: context.dynamicWidth(0.15),
                                child: AutoSizeText(
                                  viewModel.vehicles[index].name,
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: context.colorScheme.primaryVariant,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      );

  // Kendi konumuma götür
  Widget _myLocation(BuildContext context, EnterRouteMapViewModel viewModel) =>
      Padding(
        padding: context.paddingNormal,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: context.paddingLow,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              height: 30,
              width: 30,
              child: MaterialButton(
                shape: const CircleBorder(),
                onPressed: () => {viewModel.setCurrentLocation()},
                highlightColor: Colors.grey[200],
                padding: const EdgeInsets.all(0),
                child: SvgPicture.asset(SVGImageConstants.instance.myLocation),
              ),
            ),
          ),
        ),
      );
}
