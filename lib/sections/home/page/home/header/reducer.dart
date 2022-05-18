import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeHeaderState>? buildReducer() {
  return asReducer(
    <Object, Reducer<HomeHeaderState>>{
      HomeHeaderAction.action: _onAction,
    },
  );
}

HomeHeaderState _onAction(HomeHeaderState state, Action action) {
  final HomeHeaderState newState = state.clone();
  return newState;
}
