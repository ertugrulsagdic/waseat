import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/view/footprint/view/foot_print_view.dart';
import 'package:waseat/view/enter_route_map/view/enter_route_map_view.dart';
import 'package:waseat/view/gamification/view/gamification_view.dart';
import 'package:waseat/view/profile/view/profile_view.dart';

import '../../../core/base/viewmodel/base_view_model.dart';

part 'bottom_tab_view_model.g.dart';

class BottomTabViewModel = _BottomTabViewModelBase with _$BottomTabViewModel;

abstract class _BottomTabViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  List<Widget> tabs = [
    FootPrintView(),
    const EnterRouteMapView(),
    const GamificationView(),
    const ProfileView()
  ];

  @observable
  int tabIndex = 0;

  @action
  void changeTabIndex(index) {
    tabIndex = index;
  }
}
