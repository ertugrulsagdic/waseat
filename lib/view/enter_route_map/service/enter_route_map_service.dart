import '../../../core/constants/network/network_route_enum.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../../../../core/utility/service_helper.dart';
import 'i_enter_route_map_service.dart';

class EnterRouteMapService extends IEnterRouteMapService with ServiceHelper {
  EnterRouteMapService(INetworkManager manager) : super(manager);

  @override
  Future<BaseResponseModel?> fetchPlace() async {
    // var response = await manager.send<BaseResponseModel, BaseResponseModel>(
    //   NetworkRoutes.DEFAULT,
    //   parseModel: BaseResponseModel(),
    //   method: method,
    //   options: options,
    //   data: dataModelJson,
    //   urlSuffix: urlSuffix,
    // );
  }
}
