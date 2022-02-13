import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_coordinate_response_model.g.dart';

@JsonSerializable()
class FindFootPrintCoordinateResponseModel
    extends INetworkModel<FindFootPrintCoordinateResponseModel> {
  double? lat;
  double? lng;
  String? address;

  FindFootPrintCoordinateResponseModel({this.lat, this.lng, this.address});

  @override
  FindFootPrintCoordinateResponseModel fromJson(Map<String, dynamic> json) {
    return _$FindFootPrintCoordinateResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootPrintCoordinateResponseModelToJson(this);
  }
}
