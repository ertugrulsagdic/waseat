// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitModel _$InitModelFromJson(Map<String, dynamic> json) => InitModel(
      suggestionTypes: (json['suggestionTypes'] as List<dynamic>?)
          ?.map((e) => SuggestionTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflows: (json['workflows'] as List<dynamic>?)
          ?.map((e) => Workflows.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeUser: json['activeUser'] == null
          ? null
          : ActiveUser.fromJson(json['activeUser'] as Map<String, dynamic>),
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => Departments.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InitModelToJson(InitModel instance) => <String, dynamic>{
      'suggestionTypes': instance.suggestionTypes,
      'workflows': instance.workflows,
      'activeUser': instance.activeUser,
      'departments': instance.departments,
      'permissions': instance.permissions,
    };

SuggestionTypes _$SuggestionTypesFromJson(Map<String, dynamic> json) =>
    SuggestionTypes(
      id: json['_id'] as String?,
      text: json['text'] as String?,
      business_id: json['business_id'] as String?,
    );

Map<String, dynamic> _$SuggestionTypesToJson(SuggestionTypes instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'business_id': instance.business_id,
    };

Workflows _$WorkflowsFromJson(Map<String, dynamic> json) => Workflows(
      id: json['_id'] as String?,
      text: json['text'] as String?,
      suggestionCount: json['suggestionCount'] as int?,
    );

Map<String, dynamic> _$WorkflowsToJson(Workflows instance) => <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'suggestionCount': instance.suggestionCount,
    };

ActiveUser _$ActiveUserFromJson(Map<String, dynamic> json) => ActiveUser(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      user_gsm: json['user_gsm'] as String?,
      business_id: json['business_id'] as String?,
      avatar_img_url: json['avatar_img_url'] as String?,
      approvedSuggestionsCount: json['approvedSuggestionsCount'] as int?,
      suggestionCount: json['suggestionCount'] as int?,
      userPoint: json['userPoint'] as int?,
      is_admin: json['is_admin'] as bool?,
    );

Map<String, dynamic> _$ActiveUserToJson(ActiveUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'user_gsm': instance.user_gsm,
      'business_id': instance.business_id,
      'avatar_img_url': instance.avatar_img_url,
      'approvedSuggestionsCount': instance.approvedSuggestionsCount,
      'suggestionCount': instance.suggestionCount,
      'userPoint': instance.userPoint,
      'is_admin': instance.is_admin,
    };

Departments _$DepartmentsFromJson(Map<String, dynamic> json) => Departments(
      id: json['_id'] as String?,
      description: json['description'] as String?,
      userCount: json['userCount'] as int?,
    );

Map<String, dynamic> _$DepartmentsToJson(Departments instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'description': instance.description,
      'userCount': instance.userCount,
    };

Permissions _$PermissionsFromJson(Map<String, dynamic> json) => Permissions(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
