import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/core/base/viewmodel/base_view_model.dart';
part 'gamification_view_model.g.dart';

class GamificationViewModel = _GamificationViewModelBase
    with _$GamificationViewModel;

abstract class _GamificationViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
