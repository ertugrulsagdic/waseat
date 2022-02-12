import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:waseat/core/base/viewmodel/base_view_model.dart';
part 'foot_print_view_model.g.dart';

class FootPrintViewModel = _FootPrintViewModelBase with _$FootPrintViewModel;

abstract class _FootPrintViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
