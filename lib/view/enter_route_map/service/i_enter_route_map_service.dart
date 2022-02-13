import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';

abstract class IEnterRouteMapService {
  final INetworkManager manager;

  IEnterRouteMapService(this.manager);

  Future<BaseResponseModel?> fetchPlace(String text);
  Future<BaseResponseModel?> fetchCoordinate(String place_id);
}
