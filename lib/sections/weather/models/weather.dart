import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/utils/weather_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherStage {
  WeatherStage();

  String? status;
  String? api_version;
  String? api_status;
  String? lang;
  String? unit;
  int? tzshift;
  String? timezone;
  int? server_time;
  List<double>? location;
  WeatherResult? result;

  factory WeatherStage.fromJson(Map<String, dynamic> json) =>
      _$WeatherStageFromJson(json);

  toJson() => _$WeatherStageToJson(this);
}

@JsonSerializable()
class WeatherResult {
  WeatherResult();

  ///未来几天
  WeatherResultDaily? daily;

  ///实时
  WeatherResultRealTime? realtime;

  ///未来24小时天气
  WeatherHourly? hourly;

  ///警告
  WeatherResultAlert? alert;

  int? primary;
  String? forecast_keypoint;

  factory WeatherResult.fromJson(Map<String, dynamic> json) =>
      _$WeatherResultFromJson(json);

  toJson() => _$WeatherResultToJson(this);
}

@JsonSerializable()
class WeatherResultAlert {
  WeatherResultAlert();

  String? status;
  List<AlertContent>? content;
  List<AlertAdcodes>? adcodes;

  factory WeatherResultAlert.fromJson(Map<String, dynamic> json) =>
      _$WeatherResultAlertFromJson(json);

  toJson() => _$WeatherResultAlertToJson(this);
}

@JsonSerializable()
class WeatherHourly {
  WeatherHourly();

  String? status;
  String? description;
  List<HourlyPrecipitation>? precipitation;
  List<HourlyPrecipitation>? temperature;
  List<HourlyPrecipitation>? apparent_temperature;
  List<HourlyPrecipitation>? wind;
  List<HourlyPrecipitation>? humidity;
  List<HourlyPrecipitation>? cloudrate;
  List<HourlySkycon>? skycon;
  List<HourlyPrecipitation>? pressure;
  List<HourlyPrecipitation>? visibility;
  List<HourlyPrecipitation>? dswrf;
  HourlyAir? air_quality;

  factory WeatherHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourlyFromJson(json);

  toJson() => _$WeatherHourlyToJson(this);
}

@JsonSerializable()
class WeatherResultDaily {
  WeatherResultDaily();

  String? status;
  List<DailyAstro>? astro;
  List<DailyItem>? precipitation;
  List<DailyItem>? temperature;
  List<DailyItemSpeed>? wind;
  List<DailyItem>? humidity;
  List<DailyItem>? cloudrate;
  List<DailyItem>? pressure;
  List<DailyItem>? visibility;
  List<DailyItem>? dswrf;
  DailyAir? air_quality;
  List<DailySkyItem>? skycon;
  List<DailySkyItem>? skycon_08h_20h;
  List<DailySkyItem>? skycon_20h_32h;
  DailyLifeIndex? life_index;

  factory WeatherResultDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherResultDailyFromJson(json);

  toJson() => _$WeatherResultDailyToJson(this);
}

@JsonSerializable()
class DailyAstro {
  DailyAstro();

  String? date;
  AstroSunrise? sunrise;
  AstroSunrise? sunset;

  factory DailyAstro.fromJson(Map<String, dynamic> json) =>
      _$DailyAstroFromJson(json);

  toJson() => _$DailyAstroToJson(this);
}

@JsonSerializable()
class AstroSunrise {
  AstroSunrise();

  String? time;

  factory AstroSunrise.fromJson(Map<String, dynamic> json) =>
      _$AstroSunriseFromJson(json);

  toJson() => _$AstroSunriseToJson(this);
}

@JsonSerializable()
class DailyAir {
  DailyAir();

  List<DailyItemChn>? aqi;
  List<DailyItem>? pm25;

  factory DailyAir.fromJson(Map<String, dynamic> json) =>
      _$DailyAirFromJson(json);

  toJson() => _$DailyAirToJson(this);
}

@JsonSerializable()
class DailyLifeIndex {
  DailyLifeIndex();

  List<DailyLifeItem>? ultraviolet;
  List<DailyLifeItem>? carWashing;
  List<DailyLifeItem>? dressing;
  List<DailyLifeItem>? comfort;
  List<DailyLifeItem>? coldRisk;

  factory DailyLifeIndex.fromJson(Map<String, dynamic> json) =>
      _$DailyLifeIndexFromJson(json);

  toJson() => _$DailyLifeIndexToJson(this);
}

@JsonSerializable()
class DailyItem {
  DailyItem();

  String? date;
  double? max;
  double? min;
  double? avg;

  factory DailyItem.fromJson(Map<String, dynamic> json) =>
      _$DailyItemFromJson(json);

  toJson() => _$DailyItemToJson(this);
}

@JsonSerializable()
class DailyItemSpeed {
  DailyItemSpeed();

  String? date;
  DailyChildSpeed? max;
  DailyChildSpeed? min;
  DailyChildSpeed? avg;

  factory DailyItemSpeed.fromJson(Map<String, dynamic> json) =>
      _$DailyItemSpeedFromJson(json);

  toJson() => _$DailyItemSpeedToJson(this);
}

@JsonSerializable()
class DailyItemChn {
  DailyItemChn();

  String? date;
  DailyChildChn? max;
  DailyChildChn? min;
  DailyChildChn? avg;

  factory DailyItemChn.fromJson(Map<String, dynamic> json) =>
      _$DailyItemChnFromJson(json);

  toJson() => _$DailyItemChnToJson(this);
}

@JsonSerializable()
class DailyChildSpeed {
  DailyChildSpeed();

  double? speed;
  double? direction;

  factory DailyChildSpeed.fromJson(Map<String, dynamic> json) =>
      _$DailyChildSpeedFromJson(json);

  toJson() => _$DailyChildSpeedToJson(this);
}

@JsonSerializable()
class DailyChildChn {
  DailyChildChn();

  int? chn;
  int? usa;

  factory DailyChildChn.fromJson(Map<String, dynamic> json) =>
      _$DailyChildChnFromJson(json);

  toJson() => _$DailyChildChnToJson(this);
}

@JsonSerializable()
class DailySkyItem {
  DailySkyItem();

  String? date;
  String? value;

  factory DailySkyItem.fromJson(Map<String, dynamic> json) =>
      _$DailySkyItemFromJson(json);

  toJson() => _$DailySkyItemToJson(this);
}

@JsonSerializable()
class DailyLifeItem {
  DailyLifeItem();

  String? date;
  String? index;
  String? desc;

  factory DailyLifeItem.fromJson(Map<String, dynamic> json) =>
      _$DailyLifeItemFromJson(json);

  toJson() => _$DailyLifeItemToJson(this);
}

@JsonSerializable()
class WeatherResultRealTime {
  WeatherResultRealTime();

  String? status;
  double? temperature;
  double? humidity;
  double? cloudrate;
  String? skycon;
  double? visibility;
  double? dswrf;
  double? pressure;
  double? apparent_temperature;
  RealTimeWind? wind;
  RealTimePrecipitation? precipitation;
  RealTimeAir? air_quality;
  RealTimeLife? life_index;

  factory WeatherResultRealTime.fromJson(Map<String, dynamic> json) =>
      _$WeatherResultRealTimeFromJson(json);

  toJson() => _$WeatherResultRealTimeToJson(this);
}

@JsonSerializable()
class RealTimeWind {
  RealTimeWind();

  double? speed;
  double? direction;

  factory RealTimeWind.fromJson(Map<String, dynamic> json) =>
      _$RealTimeWindFromJson(json);

  toJson() => _$RealTimeWindToJson(this);
}

@JsonSerializable()
class RealTimePrecipitation {
  RealTimePrecipitation();

  PrecipitationLocal? local;
  PrecipitationNearest? nearest;

  factory RealTimePrecipitation.fromJson(Map<String, dynamic> json) =>
      _$RealTimePrecipitationFromJson(json);

  toJson() => _$RealTimePrecipitationToJson(this);
}

@JsonSerializable()
class PrecipitationLocal {
  PrecipitationLocal();

  String? status;
  String? datasource;
  double? intensity;

  factory PrecipitationLocal.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationLocalFromJson(json);

  toJson() => _$PrecipitationLocalToJson(this);
}

@JsonSerializable()
class PrecipitationNearest {
  PrecipitationNearest();

  String? status;
  double? distance;
  double? intensity;

  factory PrecipitationNearest.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationNearestFromJson(json);

  toJson() => _$PrecipitationNearestToJson(this);
}

@JsonSerializable()
class RealTimeAir {
  RealTimeAir();

  int? pm25;
  int? pm10;
  int? o3;
  int? so2;
  int? no2;
  double? co;
  AirAqi? aqi;
  AirDescription? description;

  factory RealTimeAir.fromJson(Map<String, dynamic> json) =>
      _$RealTimeAirFromJson(json);

  toJson() => _$RealTimeAirToJson(this);
}

@JsonSerializable()
class AirAqi {
  AirAqi();

  int? chn;
  int? usa;

  factory AirAqi.fromJson(Map<String, dynamic> json) => _$AirAqiFromJson(json);

  toJson() => _$AirAqiToJson(this);
}

@JsonSerializable()
class AirDescription {
  AirDescription();

  String? chn;
  String? usa;

  factory AirDescription.fromJson(Map<String, dynamic> json) =>
      _$AirDescriptionFromJson(json);

  toJson() => _$AirDescriptionToJson(this);
}

@JsonSerializable()
class RealTimeLife {
  RealTimeLife();

  LifeUltraviolet? ultraviolet;
  LifeComfort? comfort;

  factory RealTimeLife.fromJson(Map<String, dynamic> json) =>
      _$RealTimeLifeFromJson(json);

  toJson() => _$RealTimeLifeToJson(this);
}

@JsonSerializable()
class LifeUltraviolet {
  LifeUltraviolet();

  double? index;
  String? desc;

  factory LifeUltraviolet.fromJson(Map<String, dynamic> json) =>
      _$LifeUltravioletFromJson(json);

  toJson() => _$LifeUltravioletToJson(this);
}

@JsonSerializable()
class LifeComfort {
  LifeComfort();

  double? index;
  String? desc;

  factory LifeComfort.fromJson(Map<String, dynamic> json) =>
      _$LifeComfortFromJson(json);

  toJson() => _$LifeComfortToJson(this);
}

///24小时mode
@JsonSerializable()
class HourlyPrecipitation {
  HourlyPrecipitation();

  String? datetime;
  double? value;
  double? probability;
  double? speed;
  double? direction;

  factory HourlyPrecipitation.fromJson(Map<String, dynamic> json) =>
      _$HourlyPrecipitationFromJson(json);

  toJson() => _$HourlyPrecipitationToJson(this);
}

@JsonSerializable()
class HourlySkycon {
  HourlySkycon();

  String? datetime;
  String? value;

  factory HourlySkycon.fromJson(Map<String, dynamic> json) =>
      _$HourlySkyconFromJson(json);

  toJson() => _$HourlySkyconToJson(this);
}

@JsonSerializable()
class HourlyAir {
  HourlyAir();

  List<HourlyAirAqi>? aqi;
  List<HourlyPrecipitation>? pm25;

  factory HourlyAir.fromJson(Map<String, dynamic> json) =>
      _$HourlyAirFromJson(json);

  toJson() => _$HourlyAirToJson(this);
}

@JsonSerializable()
class HourlyAirAqi {
  HourlyAirAqi();

  String? datetime;
  DailyChildChn? value;

  factory HourlyAirAqi.fromJson(Map<String, dynamic> json) =>
      _$HourlyAirAqiFromJson(json);

  toJson() => _$HourlyAirAqiToJson(this);
}

///alert
@JsonSerializable()
class AlertContent {
  AlertContent();

  String? province;
  String? status;
  String? code;
  String? description;
  String? regionId;
  String? county;
  String? alertId;
  String? title;
  String? adcode;
  String? source;
  String? location;
  String? request_status;
  List<double>? latlon;

  factory AlertContent.fromJson(Map<String, dynamic> json) =>
      _$AlertContentFromJson(json);

  toJson() => _$AlertContentToJson(this);
}

@JsonSerializable()
class AlertAdcodes {
  AlertAdcodes();

  double? adcode;
  String? name;

  factory AlertAdcodes.fromJson(Map<String, dynamic> json) =>
      _$AlertAdcodesFromJson(json);

  toJson() => _$AlertAdcodesToJson(this);
}

///custom
class HourlySectionMode {
  HourlySectionMode();
  String? description;
  List<HourlyItemMode>? models;
}

class HourlyItemMode {
  HourlyItemMode();
  String? normal;
  String? datetime;
  String? skycon;
  String? value;
}

class DailyChildModel {
  DailyChildModel();
  String? dateTime;
  String? weekday;

  String? skycon;
  String? min;
  String? max;
}

class DailyLifeModel {
  DailyLifeModel();

  IconData? iconData;
  String? title;
  String? desc;
}

class AlertMessageMode {
  AlertMessageMode();
  String? header;
  String? title;
  String? desc;
}
