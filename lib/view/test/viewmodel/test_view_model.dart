import 'package:flutter/cupertino.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/init/notifier/theme_notifer.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {}

  @observable
  int number = 0;

  @action
  void incrementNumber() {
    number++;
  }
}
