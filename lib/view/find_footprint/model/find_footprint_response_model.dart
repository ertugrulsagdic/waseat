import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_response_model.g.dart';

@JsonSerializable()
class FindFootPrintResponseModel
    extends INetworkModel<FindFootPrintResponseModel> {
  String text;
  @JsonKey(name: 'place_id')
  String? placeId;

  FindFootPrintResponseModel({required this.text, this.placeId});

  @override
  FindFootPrintResponseModel fromJson(Map<String, dynamic> json) {
    return _$FindFootPrintResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootPrintResponseModelToJson(this);
  }
}
