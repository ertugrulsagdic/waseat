// ignore_for_file: constant_identifier_names

import 'package:waseat/core/constants/image/svg_constants.dart';

enum SearchTabEnum {
  FOOT,
  BIKE,
  CAR,
  TRANSPORTATION,
  BICYCLE,
  SCOOTER,
}

extension StatuToString on int {
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
