import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WeatherPlaceState>? buildEffect() {
  return combineEffects(<Object, Effect<WeatherPlaceState>>{
    WeatherPlaceAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WeatherPlaceState> ctx) {}
