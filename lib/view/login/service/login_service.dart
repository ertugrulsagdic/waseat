import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../../../../core/utility/service_helper.dart';
import '../../../core/constants/network/network_route_enum.dart';
import '../model/init_model.dart';
import '../model/login_model.dart';
import 'i_login_service.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<BaseResponseModel?> postLogin(LoginModel model) async {
    var response = await requestJson(
      manager,
      NetworkRoutes.LOGIN,
      RequestType.POST,
      dataModel: model,
      token: false,
    );
    return response;
  }

  @override
  Future<BaseResponseModel?> fetchInit() async {
  //   var response = await requestJson(
  //     manager,
  //     NetworkRoutes.INIT,
  //     RequestType.GET,
  //     dataParser: InitModel(),
  //   );
  //   return response;
  }
}