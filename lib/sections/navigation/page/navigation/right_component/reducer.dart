import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavigationRightState>? buildReducer() {
  return asReducer(
    <Object, Reducer<NavigationRightState>>{
      NavigationRightAction.didRefresh: _didRefresh,
    },
  );
}

NavigationRightState _didRefresh(NavigationRightState state, Action action) {
  final NavigationRightState newState = state.clone();
  return newState;
}
