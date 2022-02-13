import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'enter_route_map_response_model.g.dart';

@JsonSerializable()
class EnterRouteMapResponseModel
    extends INetworkModel<EnterRouteMapResponseModel> {
  String text;
  @JsonKey(name: 'place_id')
  String? placeId;

  EnterRouteMapResponseModel({required this.text, this.placeId});

  @override
  EnterRouteMapResponseModel fromJson(Map<String, dynamic> json) {
    return _$EnterRouteMapResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$EnterRouteMapResponseModelToJson(this);
  }
}
