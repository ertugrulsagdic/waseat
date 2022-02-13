import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'enter_route_map_coordinate_model.g.dart';

@JsonSerializable()
class EnterRouteMapCoordinateModel
    extends INetworkModel<EnterRouteMapCoordinateModel> {
  @JsonKey(name: 'place_id')
  String? placeId;

  EnterRouteMapCoordinateModel({this.placeId});

  @override
  EnterRouteMapCoordinateModel fromJson(Map<String, dynamic> json) {
    return _$EnterRouteMapCoordinateModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$EnterRouteMapCoordinateModelToJson(this);
  }
}
