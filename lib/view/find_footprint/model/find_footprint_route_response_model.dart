import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'find_footprint_route_response_model.g.dart';

@JsonSerializable()
class FindFootprintRouteResponseModel
    extends INetworkModel<FindFootprintRouteResponseModel> {
  List<Walking>? walking;
  List<Bicycling>? bicycling;
  List<Driving>? driving;
  List<Transit>? transit;
  List<Scooter>? scooter;

  FindFootprintRouteResponseModel(
      {this.walking, this.bicycling, this.driving, this.transit, this.scooter});

  @override
  FindFootprintRouteResponseModel fromJson(Map<String, dynamic> json) {
    return _$FindFootprintRouteResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FindFootprintRouteResponseModelToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Walking extends INetworkModel<Walking> {
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  List<String>? useTravels;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_address')
  String? endAddress;
  Location? endLocation;
  Location? startLocation;
  @JsonKey(name: 'start_address')
  String? startAddress;
  List<Steps>? steps;

  Walking(
      {this.co2,
      this.durationMinute,
      this.useTravels,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.startTime,
      this.endTime,
      this.endAddress,
      this.endLocation,
      this.startLocation,
      this.startAddress,
      this.steps});

  factory Walking.fromJson(Map<String, dynamic> json) {
    return _$WalkingFromJson(json);
  }
  @override
  Walking fromJson(Map<String, dynamic> json) {
    return _$WalkingFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WalkingToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Location extends INetworkModel<Location> {
  int? lat;
  int? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
  @override
  Location fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Steps extends INetworkModel<Steps> {
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  String? travel;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  Location? endLocation;
  Location? startLocation;

  Steps(
      {this.co2,
      this.durationMinute,
      this.travel,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.endLocation,
      this.startLocation});

  factory Steps.fromJson(Map<String, dynamic> json) {
    return _$StepsFromJson(json);
  }
  @override
  Steps fromJson(Map<String, dynamic> json) {
    return _$StepsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StepsToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Bicycling extends INetworkModel<Bicycling> {
  List<String>? useTravels;
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  @JsonKey(name: 'end_address')
  String? endAddress;
  Location? endLocation;
  Location? startLocation;
  @JsonKey(name: 'start_address')
  String? startAddress;
  List<Steps>? steps;

  Bicycling(
      {this.useTravels,
      this.co2,
      this.durationMinute,
      this.startTime,
      this.endTime,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.endAddress,
      this.endLocation,
      this.startLocation,
      this.startAddress,
      this.steps});

  factory Bicycling.fromJson(Map<String, dynamic> json) {
    return _$BicyclingFromJson(json);
  }
  @override
  Bicycling fromJson(Map<String, dynamic> json) {
    return _$BicyclingFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BicyclingToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Driving extends INetworkModel<Driving> {
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  List<String>? useTravels;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_address')
  String? endAddress;
  Location? endLocation;
  Location? startLocation;
  @JsonKey(name: 'start_address')
  String? startAddress;
  List<Steps>? steps;

  Driving(
      {this.co2,
      this.durationMinute,
      this.useTravels,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.startTime,
      this.endTime,
      this.endAddress,
      this.endLocation,
      this.startLocation,
      this.startAddress,
      this.steps});

  factory Driving.fromJson(Map<String, dynamic> json) {
    return _$DrivingFromJson(json);
  }
  @override
  Driving fromJson(Map<String, dynamic> json) {
    return _$DrivingFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DrivingToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Transit extends INetworkModel<Transit> {
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  List<String>? useTravels;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_address')
  String? endAddress;
  Location? endLocation;
  Location? startLocation;
  @JsonKey(name: 'start_address')
  String? startAddress;
  List<Steps>? steps;

  Transit(
      {this.co2,
      this.durationMinute,
      this.useTravels,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.startTime,
      this.endTime,
      this.endAddress,
      this.endLocation,
      this.startLocation,
      this.startAddress,
      this.steps});

  factory Transit.fromJson(Map<String, dynamic> json) {
    return _$TransitFromJson(json);
  }
  @override
  Transit fromJson(Map<String, dynamic> json) {
    return _$TransitFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransitToJson(this);
  }
}

@JsonSerializable(createFactory: true)
class Scooter extends INetworkModel<Scooter> {
  List<String>? useTravels;
  int? co2;
  @JsonKey(name: 'duration_minute')
  String? durationMinute;
  String? duration;
  @JsonKey(name: 'duration_value')
  int? durationValue;
  String? distance;
  @JsonKey(name: 'distance_value')
  int? distanceValue;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_address')
  String? endAddress;
  Location? endLocation;
  Location? startLocation;
  @JsonKey(name: 'start_address')
  String? startAddress;
  List<Steps>? steps;

  Scooter(
      {this.useTravels,
      this.co2,
      this.durationMinute,
      this.duration,
      this.durationValue,
      this.distance,
      this.distanceValue,
      this.startTime,
      this.endTime,
      this.endAddress,
      this.endLocation,
      this.startLocation,
      this.startAddress,
      this.steps});

  factory Scooter.fromJson(Map<String, dynamic> json) {
    return _$ScooterFromJson(json);
  }
  @override
  Scooter fromJson(Map<String, dynamic> json) {
    return _$ScooterFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ScooterToJson(this);
  }
}
