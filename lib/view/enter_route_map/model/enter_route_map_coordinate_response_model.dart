import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'enter_route_map_coordinate_response_model.g.dart';

@JsonSerializable()
class EnterRouteMapCoordinateResponseModel
    extends INetworkModel<EnterRouteMapCoordinateResponseModel> {
  double? lat;
  double? lng;
  String? address;

  EnterRouteMapCoordinateResponseModel({this.lat, this.lng, this.address});

  @override
  EnterRouteMapCoordinateResponseModel fromJson(Map<String, dynamic> json) {
    return _$EnterRouteMapCoordinateResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$EnterRouteMapCoordinateResponseModelToJson(this);
  }
}
