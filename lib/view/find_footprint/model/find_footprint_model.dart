import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_model.g.dart';

@JsonSerializable()
class FindFootPrintModel extends INetworkModel<FindFootPrintModel> {
  String? text;

  FindFootPrintModel({this.text});

  @override
  FindFootPrintModel fromJson(Map<String, dynamic> json) {
    return _$FindFootPrintModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootPrintModelToJson(this);
  }
}
