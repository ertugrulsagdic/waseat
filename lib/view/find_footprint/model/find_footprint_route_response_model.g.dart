// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_footprint_route_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindFootprintRouteResponseModel _$FindFootprintRouteResponseModelFromJson(
        Map<String, dynamic> json) =>
    FindFootprintRouteResponseModel(
      walking: (json['walking'] as List<dynamic>?)
          ?.map((e) => Walking.fromJson(e as Map<String, dynamic>))
          .toList(),
      bicycling: (json['bicycling'] as List<dynamic>?)
          ?.map((e) => Bicycling.fromJson(e as Map<String, dynamic>))
          .toList(),
      driving: (json['driving'] as List<dynamic>?)
          ?.map((e) => Driving.fromJson(e as Map<String, dynamic>))
          .toList(),
      transit: (json['transit'] as List<dynamic>?)
          ?.map((e) => Transit.fromJson(e as Map<String, dynamic>))
          .toList(),
      scooter: (json['scooter'] as List<dynamic>?)
          ?.map((e) => Scooter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FindFootprintRouteResponseModelToJson(
        FindFootprintRouteResponseModel instance) =>
    <String, dynamic>{
      'walking': instance.walking,
      'bicycling': instance.bicycling,
      'driving': instance.driving,
      'transit': instance.transit,
      'scooter': instance.scooter,
    };

Walking _$WalkingFromJson(Map<String, dynamic> json) => Walking(
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      useTravels: (json['useTravels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      endAddress: json['end_address'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WalkingToJson(Walking instance) => <String, dynamic>{
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'useTravels': instance.useTravels,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'end_address': instance.endAddress,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'start_address': instance.startAddress,
      'steps': instance.steps,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: json['lat'] as int?,
      lng: json['lng'] as int?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Steps _$StepsFromJson(Map<String, dynamic> json) => Steps(
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      travel: json['travel'] as String?,
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'travel': instance.travel,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
    };

Bicycling _$BicyclingFromJson(Map<String, dynamic> json) => Bicycling(
      useTravels: (json['useTravels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      endAddress: json['end_address'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BicyclingToJson(Bicycling instance) => <String, dynamic>{
      'useTravels': instance.useTravels,
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'end_address': instance.endAddress,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'start_address': instance.startAddress,
      'steps': instance.steps,
    };

Driving _$DrivingFromJson(Map<String, dynamic> json) => Driving(
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      useTravels: (json['useTravels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      endAddress: json['end_address'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrivingToJson(Driving instance) => <String, dynamic>{
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'useTravels': instance.useTravels,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'end_address': instance.endAddress,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'start_address': instance.startAddress,
      'steps': instance.steps,
    };

Transit _$TransitFromJson(Map<String, dynamic> json) => Transit(
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      useTravels: (json['useTravels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      endAddress: json['end_address'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransitToJson(Transit instance) => <String, dynamic>{
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'useTravels': instance.useTravels,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'end_address': instance.endAddress,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'start_address': instance.startAddress,
      'steps': instance.steps,
    };

Scooter _$ScooterFromJson(Map<String, dynamic> json) => Scooter(
      useTravels: (json['useTravels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      co2: json['co2'] as int?,
      durationMinute: json['duration_minute'] as String?,
      duration: json['duration'] as String?,
      durationValue: json['duration_value'] as int?,
      distance: json['distance'] as String?,
      distanceValue: json['distance_value'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      endAddress: json['end_address'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScooterToJson(Scooter instance) => <String, dynamic>{
      'useTravels': instance.useTravels,
      'co2': instance.co2,
      'duration_minute': instance.durationMinute,
      'duration': instance.duration,
      'duration_value': instance.durationValue,
      'distance': instance.distance,
      'distance_value': instance.distanceValue,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'end_address': instance.endAddress,
      'endLocation': instance.endLocation,
      'startLocation': instance.startLocation,
      'start_address': instance.startAddress,
      'steps': instance.steps,
    };
