import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_coordinate_model.g.dart';

@JsonSerializable()
class FindFootPrintCoordinateModel
    extends INetworkModel<FindFootPrintCoordinateModel> {
  @JsonKey(name: 'place_id')
  String? placeId;

  FindFootPrintCoordinateModel({this.placeId});

  @override
  FindFootPrintCoordinateModel fromJson(Map<String, dynamic> json) {
    return _$FindFootPrintCoordinateModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootPrintCoordinateModelToJson(this);
  }
}
