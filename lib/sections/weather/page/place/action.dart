import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WeatherPlaceAction { action }

class WeatherPlaceActionCreator {
  static Action onAction() {
    return const Action(WeatherPlaceAction.action);
  }
}
