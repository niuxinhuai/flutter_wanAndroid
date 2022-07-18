import 'package:json_annotation/json_annotation.dart';

part 'amap.g.dart';

@JsonSerializable()
class MapLocationEvent {
  MapLocationEvent();

  String? callbackTime;
  String? locationTime;
  String? latitude;
  String? longitude;
  int? errorCode;
  String? errorInfo;

  factory MapLocationEvent.fromJson(Map<String, dynamic> json) =>
      _$MapLocationEventFromJson(json);

  toJson() => _$MapLocationEventToJson(this);
}
