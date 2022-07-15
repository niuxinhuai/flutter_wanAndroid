import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';

enum WeatherAction { action, didRefresh }

class WeatherActionCreator {
  static Action onAction() {
    return const Action(WeatherAction.action);
  }

  static Action didRefreshAction(WeatherStage weatherStage) {
    return Action(WeatherAction.didRefresh, payload: weatherStage);
  }
}
