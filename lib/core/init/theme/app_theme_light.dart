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
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
          disabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(),
          contentPadding: EdgeInsets.all(0),
        ),
        appBarTheme: AppBarTheme(
          titleSpacing: 0,
          centerTitle: false,
          color: _appColorScheme.surface,
          titleTextStyle: textTheme.headline5,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _appColorScheme.primary,
        ),
      );

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _appColorScheme.primary,
        textStyle: textTheme.button,
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 3,
          primary: _appColorScheme.primary,
          textStyle: textTheme.button),
    );
  }

  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: _appColorScheme.primary,
          textStyle: textTheme.button,
          side: const BorderSide(
            width: 2,
          ),
        ),
      );

  TextTheme get textTheme {
    return ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline4: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline6: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.background,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.background,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          button: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          overline: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: _appColorScheme.onSecondary,
              letterSpacing: 0.5),
        );
  }

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: Color(0xFF0D1C2E),
      primaryVariant: Color(0xFF5E6375),
      secondary: Color(0xFF2B4BF2),
      secondaryVariant: Color(0xFF03249D),
      surface: Colors.white,
      background: Color(0xFFF0F3F5),
      error: Color(0xFFEC002D),
      onPrimary: Color(0xFFE3E8FF),
      onSecondary: Color(0xFF838F9C),
      onSurface: Color(0xFFEC7F00),
      onBackground: Color(0xFF469E7B),
      onError: Color(0xFF00C382),
      brightness: Brightness.light,
    );
  }
}
