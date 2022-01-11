import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData currentTheme = AppThemeLight.instance.theme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get getCurrentThemeEnum => _currentThemeEnum;

  ThemeData get getCurrentTheme => currentTheme;

  /// Change your app theme with [currentThemeEnum] value.
  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentThemeEnum = AppThemes.LIGHT;
    }
    _changeValue(_currentThemeEnum);
  }

  void _changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      currentTheme = AppThemeLight.instance.theme;
    } else {
      currentTheme = AppThemeDark.instance.theme;
    }
    notifyListeners();
  }
}
