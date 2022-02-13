import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_route_model.g.dart';

@JsonSerializable()
class FindFootprintRouteModel extends INetworkModel<FindFootprintRouteModel> {
  String? from;
  String? to;

  FindFootprintRouteModel({this.from, this.to});

  @override
  FindFootprintRouteModel fromJson(Map<String, dynamic> json) {
    return _$FindFootprintRouteModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootprintRouteModelToJson(this);
  }
}
