import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends INetworkModel<TestModel> {
  String? registry_no;

  TestModel({this.registry_no});

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }
}
