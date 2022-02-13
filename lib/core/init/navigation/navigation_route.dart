import 'package:flutter/material.dart';
import 'package:waseat/view/bottomtab/view/bottom_tab_view.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_coordinate_model.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_coordinate_response_model.dart';
import 'package:waseat/view/find_footprint/view/find_footprint_view.dart';
import 'package:waseat/view/login/view/login_view.dart';

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
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView());
      // case NavigationConstants.SIGNIN:
      //   return normalNavigate(const SigninView)));
      case NavigationConstants.FIND_FOOTPRINT:
        final model = args.arguments as EnterRouteMapCoordinateResponseModel;
        return normalNavigate(FindFootprintView(coordinateModel: model));
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
