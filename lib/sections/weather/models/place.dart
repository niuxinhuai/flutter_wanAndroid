import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class PlaceStage {
  PlaceStage();

  String? status;
  String? query;
  List<CityPlace>? places;

  factory PlaceStage.fromJson(Map<String, dynamic> json) =>
      _$PlaceStageFromJson(json);

  toJson() => _$PlaceStageToJson(this);
}

@JsonSerializable()
class CityPlace {
  CityPlace();

  String? id;
  String? name;
  String? formatted_address;
  String? place_id;
  CityLocation? location;

  factory CityPlace.fromJson(Map<String, dynamic> json) =>
      _$CityPlaceFromJson(json);

  toJson() => _$CityPlaceToJson(this);
}

@JsonSerializable()
class CityLocation {
  CityLocation();

  double? lat;
  double? lng;

  factory CityLocation.fromJson(Map<String, dynamic> json) =>
      _$CityLocationFromJson(json);

  toJson() => _$CityLocationToJson(this);
}

class PlaceChildItem {
  PlaceChildItem();

  String? name;
  String? id;
  String? temperature;
  String? min;
  String? max;
  String? skycon;
}
