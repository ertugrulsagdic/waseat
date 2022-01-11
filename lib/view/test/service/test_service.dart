import 'package:flutter_template/core/constants/network/network_route_enum.dart';
import 'package:flutter_template/view/test/model/test_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../../../../core/utility/service_helper.dart';
import './i_test_service.dart';

class TestService extends ITestService with ServiceHelper {
  TestService(INetworkManager manager) : super(manager);

  @override
  Future<BaseResponseModel?> fetchExample() async {
    var response = await requestJson(
        manager, NetworkRoutes.TEST, RequestType.POST,
        dataModel: TestModel(registry_no: 'string'));

    print(response);

    if (response.data is BaseResponseModel) {
      print(response.data.toJson());
      return response.data;
    } else {
      print(response.error.description);
      final errorModel = errorParser<BaseResponseModel, BaseResponseModel>(
          BaseResponseModel(), response.error!.description);
      return errorModel;
    }
  }
}
