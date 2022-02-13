import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/src/provider.dart';
import 'package:waseat/core/init/cache/locale_manager.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../model/init_model.dart';
import '../model/login_model.dart';
import '../service/i_login_service.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  late ILoginService loginService;

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    loginService = LoginService(vexanaManager.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isPasswordLocked = true;

  @action
  void isPassworkdLockedChange() {
    isPasswordLocked = !isPasswordLocked;
  }

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  Future<void> postLogin() async {
    isLoadingChange();
    
    final response = await loginService.postLogin(
      LoginModel(
        email: emailController!.text,
        password: passwordController!.text,
      ),
    );

    if (response!.type == true) {
      LocaleManager.instance.setStringValue(PreferencesKeys.TOKEN, response.data["token"]);
      navigation.navigateToPageClear(path: NavigationConstants.BOTTOMTAB);
    } else {
      showMessage(response);
    }

    isLoadingChange();
  }}
