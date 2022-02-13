import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../model/login_model.dart';

abstract class ILoginService {
  final INetworkManager manager;

  ILoginService(this.manager);

  Future<BaseResponseModel?> postLogin(LoginModel model);
  Future<BaseResponseModel?> fetchInit();
}
