import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

class WeatherState implements Cloneable<WeatherState> {
  CityPlace? cityPlace;
  LoadingState? loadingState;
  WeatherStage? weatherStage;
  String temperature = "℃";
  HourlySectionMode? sectionMode;
  List<DailyChildModel>? dailyModels;
  List<DailyLifeModel>? lifeModels;
  AlertMessageMode? messageMode;
  PlaceChildItem? placeChildItem;

  @override
  WeatherState clone() {
    return WeatherState()
      ..cityPlace = cityPlace
      ..loadingState = loadingState
      ..cityPlace = cityPlace
      ..weatherStage = weatherStage
      ..temperature = temperature
      ..sectionMode = sectionMode
      ..dailyModels = dailyModels
      ..lifeModels = lifeModels
      ..messageMode = messageMode
      ..placeChildItem = placeChildItem;
  }
}

WeatherState initState(Map<String, dynamic>? args) {
  return WeatherState()
    ..loadingState = LoadingState.isLoading
    ..cityPlace = CityPlace.fromJson(args!["place"]);
}
