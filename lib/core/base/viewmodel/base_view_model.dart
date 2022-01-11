import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';
import '../model/base_response_model.dart';

abstract class BaseViewModel {
  BuildContext? context;

  VexanaManager vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();

  void showMessage(BaseResponseModel? model) {
    if (model == null) return;
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          model.message ?? model.status.toString(),
        ),
        backgroundColor: model.status!
            ? context!.colorScheme.onError
            : context!.colorScheme.error,
      ),
    );
  }
}
