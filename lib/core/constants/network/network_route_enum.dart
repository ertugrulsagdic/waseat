// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:waseat/core/constants/enums/preferences_keys_enum.dart';
import 'package:waseat/core/init/cache/locale_manager.dart';

enum NetworkRoutes { DEFAULT, SEARCH_PLACE, GET_COORDINATE, GET_ROUTE, LOGIN }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    String locale =
        LocaleManager.instance.getStringValue(PreferencesKeys.LOCALE);
    switch (this) {
      case NetworkRoutes.DEFAULT:
        return '';
      case NetworkRoutes.SEARCH_PLACE:
        return '$locale/maps/place/autocomplete';
      case NetworkRoutes.GET_COORDINATE:
        return '$locale/maps/place/detail';
      case NetworkRoutes.GET_ROUTE:
        return '$locale/maps/travel';
      case NetworkRoutes.LOGIN:
        return 'en/login';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
