import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel extends INetworkModel<BaseResponseModel> {
  final bool? status;
  final String? message;
  dynamic data;

  BaseResponseModel({this.status, this.message, this.data});

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseResponseModelToJson(this);
  }
}
