import 'package:waseat/view/enter_route_map/model/enter_route_map_coordinate_model.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_coordinate_response_model.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_model.dart';
import 'package:waseat/view/enter_route_map/model/enter_route_map_response_model.dart';

import '../../../core/constants/network/network_route_enum.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../../../../core/utility/service_helper.dart';
import 'i_enter_route_map_service.dart';

class EnterRouteMapService extends IEnterRouteMapService with ServiceHelper {
  EnterRouteMapService(INetworkManager manager) : super(manager);

  @override
  Future<BaseResponseModel?> fetchPlace(String text) async {
    final result = await requestJson(
      manager,
      NetworkRoutes.SEARCH_PLACE,
      RequestType.POST,
      dataModel: EnterRouteMapModel(text: text),
      dataParser: EnterRouteMapResponseModel(text: ''),
    );
    return result;
  }

  @override
  Future<BaseResponseModel?> fetchCoordinate(String place_id) async {
    final result = await requestJson(
      manager,
      NetworkRoutes.GET_COORDINATE,
      RequestType.POST,
      dataModel: EnterRouteMapCoordinateModel(placeId: place_id),
      dataParser: EnterRouteMapCoordinateResponseModel(),
    );
    return result;
  }
}
