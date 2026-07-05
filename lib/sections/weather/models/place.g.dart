// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceStage _$PlaceStageFromJson(Map<String, dynamic> json) => PlaceStage()
  ..status = json['status'] as String?
  ..query = json['query'] as String?
  ..places = (json['places'] as List<dynamic>?)
      ?.map((e) => CityPlace.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PlaceStageToJson(PlaceStage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'query': instance.query,
      'places': instance.places,
    };

CityPlace _$CityPlaceFromJson(Map<String, dynamic> json) => CityPlace()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..formatted_address = json['formatted_address'] as String?
  ..place_id = json['place_id'] as String?
  ..location = json['location'] == null
      ? null
      : CityLocation.fromJson(json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$CityPlaceToJson(CityPlace instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'formatted_address': instance.formatted_address,
      'place_id': instance.place_id,
      'location': instance.location,
    };

CityLocation _$CityLocationFromJson(Map<String, dynamic> json) => CityLocation()
  ..lat = (json['lat'] as num?)?.toDouble()
  ..lng = (json['lng'] as num?)?.toDouble();

Map<String, dynamic> _$CityLocationToJson(CityLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
