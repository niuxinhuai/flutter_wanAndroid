import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';

enum WeatherSegmentAction {
  action,
  onTapAddPlace,
  onTapPoint,
  onPageChanged,
  didPageChanged,
  didRefresh,
  didRefreshPage,
  didDeleteWeatherItem,
  didReload,
}

class WeatherSegmentActionCreator {
  static Action onAction() {
    return const Action(WeatherSegmentAction.action);
  }

  static Action onTapPointAction(int page) {
    return Action(WeatherSegmentAction.onTapPoint, payload: page);
  }

  static Action onPageChangedAction(int index) {
    return Action(WeatherSegmentAction.onPageChanged, payload: index);
  }

  static Action onTapAddPlaceAction() {
    return const Action(WeatherSegmentAction.onTapAddPlace);
  }

  static Action didRefreshPageAction(List<CityPlace> cityPlaces) {
    return Action(WeatherSegmentAction.didRefreshPage, payload: cityPlaces);
  }

  static Action didRefreshAction(CityPlace cityPlace) {
    return Action(WeatherSegmentAction.didRefresh, payload: cityPlace);
  }

  static Action didPageChangedAction(int index) {
    return Action(WeatherSegmentAction.didPageChanged, payload: index);
  }

  static Action didDeleteWeatherItemAction(String id) {
    return Action(WeatherSegmentAction.didDeleteWeatherItem, payload: id);
  }

  static Action didReloadAction() {
    return const Action(WeatherSegmentAction.didReload);
  }
}
