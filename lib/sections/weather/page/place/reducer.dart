import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WeatherPlaceState>? buildReducer() {
  return asReducer(
    <Object, Reducer<WeatherPlaceState>>{
      WeatherPlaceAction.action: _onAction,
    },
  );
}

WeatherPlaceState _onAction(WeatherPlaceState state, Action action) {
  final WeatherPlaceState newState = state.clone();
  return newState;
}
