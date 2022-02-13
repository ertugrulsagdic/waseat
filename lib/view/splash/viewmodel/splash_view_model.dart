import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/core/constants/enums/preferences_keys_enum.dart';

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
    // TODO: change this after language change
    await LocaleManager.instance.setStringValue(PreferencesKeys.LOCALE, 'en');

    await Future.delayed(context!.durationNormal);
    await Future.delayed(context!.durationNormal);
    if (localeManager.getStringValue(PreferencesKeys.TOKEN).isEmpty){
      await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
    }
    else {await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);}
  }
}
