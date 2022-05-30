import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavigationLeftState>? buildReducer() {
  return asReducer(
    <Object, Reducer<NavigationLeftState>>{
      NavigationLeftAction.didRefreshPage: _didRefresh,
    },
  );
}

NavigationLeftState _didRefresh(NavigationLeftState state, Action action) {
  final NavigationLeftState newState = state.clone();
  return newState;
}
