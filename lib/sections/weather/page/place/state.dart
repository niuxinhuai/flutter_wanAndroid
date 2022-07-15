import 'package:fish_redux/fish_redux.dart';

class WeatherPlaceState implements Cloneable<WeatherPlaceState> {
  @override
  WeatherPlaceState clone() {
    return WeatherPlaceState();
  }
}

WeatherPlaceState initState(Map<String, dynamic>? args) {
  return WeatherPlaceState();
}
