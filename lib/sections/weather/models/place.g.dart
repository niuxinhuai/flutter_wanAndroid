// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceStage _$PlaceStageFromJson(Map json) => PlaceStage()
  ..status = json['status'] as String?
  ..query = json['query'] as String?
  ..places = (json['places'] as List<dynamic>?)
      ?.map((e) => CityPlace.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PlaceStageToJson(PlaceStage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'query': instance.query,
      'places': instance.places,
    };

CityPlace _$CityPlaceFromJson(Map json) => CityPlace()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..formatted_address = json['formatted_address'] as String?
  ..place_id = json['place_id'] as String?
  ..location = json['location'] == null
      ? null
      : CityLocation.fromJson(
          Map<String, dynamic>.from(json['location'] as Map));

Map<String, dynamic> _$CityPlaceToJson(CityPlace instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'formatted_address': instance.formatted_address,
      'place_id': instance.place_id,
      'location': instance.location,
    };

CityLocation _$CityLocationFromJson(Map json) => CityLocation()
  ..lat = (json['lat'] as num?)?.toDouble()
  ..lng = (json['lng'] as num?)?.toDouble();

Map<String, dynamic> _$CityLocationToJson(CityLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
