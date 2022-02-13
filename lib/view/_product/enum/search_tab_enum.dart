// ignore_for_file: constant_identifier_names

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/core/init/lang/locale_keys.g.dart';

enum SearchTabEnum {
  FOOT,
  BIKE,
  CAR,
  TRANSPORTATION,
  BICYCLE,
  SCOOTER,
}

extension VehicleEnumIndexToIcon on int {
  String get searchTabIcon {
    switch (this) {
      case 0:
        return SVGImageConstants.instance.walk;
      case 1:
        return SVGImageConstants.instance.bike;
      case 2:
        return SVGImageConstants.instance.car;
      case 3:
        return SVGImageConstants.instance.transportation;
      case 4:
        return SVGImageConstants.instance.bicycle;
      case 5:
        return SVGImageConstants.instance.scooter;
      default:
        throw Exception('No statu found!');
    }
  }
}

// extension VehicleToTravelMode on int {
//   String get dataKey {
//     switch (this) {
//       case 0:
//         return 'walking';
//       case 1:
//         return '';
//       case 2:
//         return TravelMode.driving;
//       case 3:
//         return TravelMode.transit;
//       case 4:
//         return TravelMode.bicycling;
//       case 5:
//         return TravelMode.driving;
//       default:
//         throw Exception('No statu found!');
//     }
//   }
// }

extension VehicleToTravelMode on int {
  TravelMode get travelMode {
    switch (this) {
      case 0:
        return TravelMode.walking;
      case 1:
        return TravelMode.driving;
      case 2:
        return TravelMode.driving;
      case 3:
        return TravelMode.transit;
      case 4:
        return TravelMode.bicycling;
      case 5:
        return TravelMode.driving;
      default:
        throw Exception('No statu found!');
    }
  }
}

extension VehicleStringToIcon on String {
  String get searchCardIcon {
    switch (this) {
      case 'WALKING':
        return SVGImageConstants.instance.walk;
      case 'TRANSIT':
        return SVGImageConstants.instance.transportation;
      default:
        throw Exception('No statu found!');
    }
  }
}

extension VehicleStringToString on String {
  String get searchCardName {
    switch (this) {
      case 'WALKING':
        return LocaleKeys.findfootprint_walking.tr();
      case 'TRANSIT':
        return LocaleKeys.findfootprint_transit.tr();
      default:
        throw Exception('No statu found!');
    }
  }
}
