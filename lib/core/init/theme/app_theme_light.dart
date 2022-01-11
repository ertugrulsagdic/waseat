import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
      fontFamily: AppConstants.FONT_FAMILY,
      colorScheme: _appColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: _appColorScheme.background,
      textButtonTheme: textButtonTheme,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: _appColorScheme.secondary,
        labelStyle: const TextStyle(),
        contentPadding: const EdgeInsets.all(10),
        filled: false,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.primaryVariant,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.primaryVariant,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.error,
          ),
        ),
        errorStyle: textTheme.caption!.copyWith(
          color: _appColorScheme.error,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        centerTitle: false,
        color: Colors.transparent,
        elevation: 0,
      ));

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _appColorScheme.surface,
        backgroundColor: _appColorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        textStyle: textTheme.button,
        elevation: 10,
        shadowColor: const Color(0xFF9595BC),
      ),
    );
  }

  TextTheme get textTheme {
    return ThemeData.light().textTheme.copyWith(
          headline4: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            color: _appColorScheme.onSecondary,
          ),
          bodyText1: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          subtitle2: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
          ),
          button: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
        );
  }

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: Color(0xFF274BDB),
      primaryVariant: Color(0xFF598BFF),
      secondary: Color(0xFF697690),
      secondaryVariant: Color(0xFFB4BDCD),
      surface: Colors.white,
      background: Color(0xFFF7F9FC),
      error: Color(0xFFEC002D),
      onPrimary: Color(0xFF181A48),
      onSecondary: Colors.black,
      onSurface: Color(0xFFEC7F00),
      onBackground: Color(0xFF008156),
      onError: Color(0xFF00C382),
      brightness: Brightness.light,
    );
  }
}
