// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapLocationEvent _$MapLocationEventFromJson(Map json) => MapLocationEvent()
  ..callbackTime = json['callbackTime'] as String?
  ..locationTime = json['locationTime'] as String?
  ..latitude = json['latitude'] as String?
  ..longitude = json['longitude'] as String?
  ..errorCode = json['errorCode'] as int?
  ..errorInfo = json['errorInfo'] as String?;

Map<String, dynamic> _$MapLocationEventToJson(MapLocationEvent instance) =>
    <String, dynamic>{
      'callbackTime': instance.callbackTime,
      'locationTime': instance.locationTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'errorCode': instance.errorCode,
      'errorInfo': instance.errorInfo,
    };
