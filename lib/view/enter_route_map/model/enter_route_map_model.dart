import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'enter_route_map_model.g.dart';

@JsonSerializable()
class EnterRouteMapModel extends INetworkModel<EnterRouteMapModel> {
  String? text;

  EnterRouteMapModel({this.text});

  @override
  EnterRouteMapModel fromJson(Map<String, dynamic> json) {
    return _$EnterRouteMapModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$EnterRouteMapModelToJson(this);
  }
}
