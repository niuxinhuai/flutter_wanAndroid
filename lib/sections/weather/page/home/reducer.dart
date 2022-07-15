import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';

import 'action.dart';
import 'state.dart';

Reducer<WeatherSegmentState>? buildReducer() {
  return asReducer(
    <Object, Reducer<WeatherSegmentState>>{
      WeatherSegmentAction.action: _onAction,
      WeatherSegmentAction.didRefresh: _didRefresh,
      WeatherSegmentAction.didPageChanged: _didPageChanged,
      WeatherSegmentAction.didRefreshPage: _didRefreshPage,
      WeatherSegmentAction.didDeleteWeatherItem: _didDeleteWeatherItem,
      WeatherSegmentAction.didReload: _didReload,
    },
  );
}

WeatherSegmentState _didRefresh(WeatherSegmentState state, Action action) {
  final CityPlace cityPlace = action.payload;
  final WeatherSegmentState newState = state.clone();
  newState.list!.add(cityPlace);
  return newState;
}

WeatherSegmentState _didRefreshPage(WeatherSegmentState state, Action action) {
  final List<CityPlace> list = action.payload;
  final WeatherSegmentState newState = state.clone();
  newState.list!.addAll(list);
  return newState;
}

WeatherSegmentState _didPageChanged(WeatherSegmentState state, Action action) {
  final int page = action.payload;
  final WeatherSegmentState newState = state.clone();
  newState.page = page;
  return newState;
}

WeatherSegmentState _didDeleteWeatherItem(
    WeatherSegmentState state, Action action) {
  final String id = action.payload;
  final WeatherSegmentState newState = state.clone();
  if (newState.list!.length != 0) {
    newState.list!.removeWhere((element) => element.id == id);
  }
  return newState;
}

WeatherSegmentState _didReload(WeatherSegmentState state, Action action) {
  final WeatherSegmentState newState = state.clone();
  return newState;
}

WeatherSegmentState _onAction(WeatherSegmentState state, Action action) {
  final WeatherSegmentState newState = state.clone();
  return newState;
}
