// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_route_map_coordinate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnterRouteMapCoordinateResponseModel
    _$EnterRouteMapCoordinateResponseModelFromJson(Map<String, dynamic> json) =>
        EnterRouteMapCoordinateResponseModel(
          lat: (json['lat'] as num?)?.toDouble(),
          lng: (json['lng'] as num?)?.toDouble(),
          address: json['address'] as String?,
        );

Map<String, dynamic> _$EnterRouteMapCoordinateResponseModelToJson(
        EnterRouteMapCoordinateResponseModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
