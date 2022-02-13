// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_route_map_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnterRouteMapResponseModel _$EnterRouteMapResponseModelFromJson(
        Map<String, dynamic> json) =>
    EnterRouteMapResponseModel(
      text: json['text'] as String,
      placeId: json['place_id'] as String?,
    );

Map<String, dynamic> _$EnterRouteMapResponseModelToJson(
        EnterRouteMapResponseModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'place_id': instance.placeId,
    };
