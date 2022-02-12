// ignore_for_file: constant_identifier_names

import 'package:waseat/core/constants/image/svg_constants.dart';

import '/core/extension/string_extension.dart';
import '/core/init/lang/locale_keys.g.dart';

enum VehicleEnum {
  BIKE,
  CAR,
  TRANSPORTATION,
  BICYCLE,
  SCOOTER,
}

extension VehicleEnumString on VehicleEnum {
  String get name {
    switch (this) {
      case VehicleEnum.BIKE:
        return LocaleKeys.map_bike.locale;
      case VehicleEnum.CAR:
        return LocaleKeys.map_car.locale;
      case VehicleEnum.TRANSPORTATION:
        return LocaleKeys.map_transportation.locale;
      case VehicleEnum.BICYCLE:
        return LocaleKeys.map_bicycle.locale;
      case VehicleEnum.SCOOTER:
        return LocaleKeys.map_scooter.locale;
      default:
        throw Exception('No statu found!');
    }
  }
}

extension StatuToString on int {
  String get vehicleIcon {
    switch (this) {
      case 0:
        return SVGImageConstants.instance.bike;
      case 1:
        return SVGImageConstants.instance.car;
      case 2:
        return SVGImageConstants.instance.transportation;
      case 3:
        return SVGImageConstants.instance.bicycle;
      case 4:
        return SVGImageConstants.instance.scooter;
      default:
        throw Exception('No statu found!');
    }
  }
}
