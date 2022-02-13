import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'init_model.g.dart';

@JsonSerializable()
class InitModel extends INetworkModel<InitModel> {
  List<SuggestionTypes>? suggestionTypes;
  List<Workflows>? workflows;
  ActiveUser? activeUser;
  List<Departments>? departments;
  List<Permissions>? permissions;

  InitModel(
      {this.suggestionTypes,
      this.workflows,
      this.activeUser,
      this.departments,
      this.permissions});

  @override
  InitModel fromJson(Map<String, dynamic> json) {
    return _$InitModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$InitModelToJson(this);
  }
}

@JsonSerializable()
class SuggestionTypes extends INetworkModel<SuggestionTypes> {
  @JsonKey(name: '_id')
  String? id;
  String? text;
  String? business_id;

  SuggestionTypes({this.id, this.text, this.business_id});

  @override
  SuggestionTypes fromJson(Map<String, dynamic> json) {
    return _$SuggestionTypesFromJson(json);
  }

  factory SuggestionTypes.fromJson(Map<String, dynamic> json) {
    return _$SuggestionTypesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SuggestionTypesToJson(this);
  }
}

@JsonSerializable()
class Workflows extends INetworkModel<Workflows> {
  @JsonKey(name: '_id')
  String? id;
  String? text;
  int? suggestionCount;

  Workflows({this.id, this.text, this.suggestionCount});

  @override
  Workflows fromJson(Map<String, dynamic> json) {
    return _$WorkflowsFromJson(json);
  }

  factory Workflows.fromJson(Map<String, dynamic> json) {
    return _$WorkflowsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WorkflowsToJson(this);
  }
}

@JsonSerializable()
class ActiveUser extends INetworkModel<ActiveUser> {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? surname;
  String? user_gsm;
  String? business_id;
  String? avatar_img_url;
  int? approvedSuggestionsCount;
  int? suggestionCount;
  int? userPoint;
  bool? is_admin;

  ActiveUser({
    this.id,
    this.name,
    this.surname,
    this.user_gsm,
    this.business_id,
    this.avatar_img_url,
    this.approvedSuggestionsCount,
    this.suggestionCount,
    this.userPoint,
    this.is_admin,
  });

  @override
  ActiveUser fromJson(Map<String, dynamic> json) {
    return _$ActiveUserFromJson(json);
  }

  factory ActiveUser.fromJson(Map<String, dynamic> json) {
    return _$ActiveUserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ActiveUserToJson(this);
  }
}

@JsonSerializable()
class Departments extends INetworkModel<Departments> {
  @JsonKey(name: '_id')
  String? id;
  String? description;
  int? userCount;

  Departments({this.id, this.description, this.userCount});

  @override
  Departments fromJson(Map<String, dynamic> json) {
    return _$DepartmentsFromJson(json);
  }

  factory Departments.fromJson(Map<String, dynamic> json) {
    return _$DepartmentsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DepartmentsToJson(this);
  }
}

@JsonSerializable()
class Permissions extends INetworkModel<Permissions> {
  @JsonKey(name: '_id')
  String? id;
  String? name;

  Permissions({this.id, this.name});

  @override
  Permissions fromJson(Map<String, dynamic> json) {
    return _$PermissionsFromJson(json);
  }

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return _$PermissionsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PermissionsToJson(this);
  }
}
