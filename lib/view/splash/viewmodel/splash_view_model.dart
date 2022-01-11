import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> controlAppState() async {
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance.initPackageInfo()
    ]);

    await Future.delayed(context!.durationNormal);
    await Future.delayed(context!.durationNormal);

    // TODO: change the navigation root
    await navigation.navigateToPageClear(path: NavigationConstants.TEST);
  }
}
