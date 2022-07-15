import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';

class WeatherSegmentState implements Cloneable<WeatherSegmentState> {
  List<CityPlace>? list;
  PageController? pageController;
  int? page;

  @override
  WeatherSegmentState clone() {
    return WeatherSegmentState()
      ..list = list
      ..pageController = pageController
      ..page = page;
  }
}

WeatherSegmentState initState(Map<String, dynamic>? args) {
  return WeatherSegmentState()
    ..list = []
    ..page = 0;
}
