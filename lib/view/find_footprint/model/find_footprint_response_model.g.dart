// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_footprint_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindFootPrintResponseModel _$FindFootPrintResponseModelFromJson(
        Map<String, dynamic> json) =>
    FindFootPrintResponseModel(
      text: json['text'] as String,
      placeId: json['place_id'] as String?,
    );

Map<String, dynamic> _$FindFootPrintResponseModelToJson(
        FindFootPrintResponseModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'place_id': instance.placeId,
    };
