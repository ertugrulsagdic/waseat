import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';

abstract class ITestService {
  final INetworkManager manager;

  ITestService(this.manager);

  Future<BaseResponseModel?> fetchExample();
}
