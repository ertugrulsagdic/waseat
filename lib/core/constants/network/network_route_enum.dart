// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:waseat/core/constants/enums/preferences_keys_enum.dart';
import 'package:waseat/core/init/cache/locale_manager.dart';

enum NetworkRoutes { DEFAULT, SEARCH_PLACE, GET_COORDINATE,LOGIN}


extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    String locale =
        LocaleManager.instance.getStringValue(PreferencesKeys.LOCALE);
    switch (this) {
      case NetworkRoutes.DEFAULT:
        return '';
      case NetworkRoutes.SEARCH_PLACE:
        // return 'public/registry/verify';
        return 'tr/maps/place/autocomplete';
      case NetworkRoutes.GET_COORDINATE:
        return 'tr/maps/place/detail';
        case NetworkRoutes.LOGIN:
        return 'en/login';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
