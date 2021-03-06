import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../model/find_footprint_route_model.dart';

abstract class IFindFootprintService {
  final INetworkManager manager;

  IFindFootprintService(this.manager);

  Future<BaseResponseModel?> fetchPlace(String text);
  Future<BaseResponseModel?> fetchCoordinate(String place_id);
  Future<BaseResponseModel?> fetchRoutes(FindFootprintRouteModel model);
}
