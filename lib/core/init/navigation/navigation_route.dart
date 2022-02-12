import 'package:flutter/material.dart';
import 'package:waseat/view/bottomtab/view/bottom_tab_view.dart';
import 'package:waseat/view/find_footprint/view/find_footprint_view.dart';

import '../../../view/splash/view/splash_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.BOTTOMTAB:
        return normalNavigate(const BottomTabView());
      case NavigationConstants.FIND_FOOTPRINT:
        return normalNavigate(FindFootprintView());
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
