import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/core/init/lang/locale_keys.g.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';
import 'package:waseat/view/find_footprint/viewmodel/find_footprint_view_model.dart';

class FindFootprintMapView extends StatelessWidget {
  final FindFootprintViewModel viewModel;

  const FindFootprintMapView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.35),
              child: GoogleMap(
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
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: context.dynamicHeight(0.35),
                child: myLocation(context, viewModel),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
    );
  }

  Widget _bottomBox(BuildContext context, FindFootprintViewModel viewModel) =>
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
            Padding(
              padding: EdgeInsets.only(
                left: context.normalValue,
                right: context.normalValue,
                top: context.lowValue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 5200.toString() + ' m. ',
                          style: context.textTheme.headline3,
                        ),
                        // Get the username from sevice and show it here
                        TextSpan(
                          text: '(' + (5.2).toString() + ' km)',
                          style: context.textTheme.headline3!
                              .copyWith(color: context.colorScheme.onSecondary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: context.dynamicWidth(0.11),
                        height: context.dynamicWidth(0.11),
                        decoration: BoxDecoration(
                          color: context.colorScheme.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Observer(builder: (_) {
                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                viewModel.tabs[viewModel.selectedTab].index
                                    .searchTabIcon,
                                fit: BoxFit.scaleDown,
                                color: context.colorScheme.secondary,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(width: context.lowValue),
                      Text(
                        0.toString() + ' CO2',
                        style: context.textTheme.headline3!
                            .copyWith(color: context.colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: context.normalValue),
            buildButton(
              context,
              onPressed: () {
                // TODO: send to backend
              },
              title: LocaleKeys.button_save.tr(),
              rounded: false,
            ),
            SizedBox(height: context.lowValue),
            buildButton(
              context,
              onPressed: () {
                // TODO: view other options
              },
              title: LocaleKeys.button_otherOptions.tr(),
              rounded: true,
            )
          ],
        ),
      );

  MaterialButton buildButton(
    BuildContext context, {
    required Function() onPressed,
    required String title,
    required bool rounded,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: context.paddingNormal,
        alignment: Alignment.center,
        width: context.width,
        decoration: BoxDecoration(
          color: rounded ? Colors.transparent : context.colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: rounded
              ? Border.all(
                  color: context.colorScheme.onSecondary,
                  width: 2,
                )
              : null,
        ),
        child: Text(
          title,
          style: context.textTheme.headline6!.copyWith(
            color: rounded
                ? context.colorScheme.primary
                : context.colorScheme.surface,
          ),
        ),
      ),
    );
  }

  // Kendi konumuma götür
  Widget myLocation(BuildContext context, FindFootprintViewModel viewModel) =>
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
              height: context.dynamicWidth(0.08),
              width: context.dynamicWidth(0.08),
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
