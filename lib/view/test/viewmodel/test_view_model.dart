import 'package:flutter/cupertino.dart';
import 'package:flutter_template/view/test/service/i_test_service.dart';
import 'package:flutter_template/view/test/service/test_service.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  late ITestService testService;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    testService = TestService(vexanaManager.networkManager);
  }

  @observable
  int number = 0;

  @action
  void incrementNumber() {
    number++;
    fetchTest();
  }

  @action
  Future<void> fetchTest() async {
    isLoadingChange();
    final response = await testService.fetchExample();

    showMessage(response);

    isLoadingChange();
  }
}
