// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_footprint_coordinate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindFootPrintCoordinateResponseModel
    _$FindFootPrintCoordinateResponseModelFromJson(Map<String, dynamic> json) =>
        FindFootPrintCoordinateResponseModel(
          lat: (json['lat'] as num?)?.toDouble(),
          lng: (json['lng'] as num?)?.toDouble(),
          address: json['address'] as String?,
        );

Map<String, dynamic> _$FindFootPrintCoordinateResponseModelToJson(
        FindFootPrintCoordinateResponseModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
