import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeCellState>? buildReducer() {
  return asReducer(
    <Object, Reducer<HomeCellState>>{
      HomeCellAction.action: _onAction,
    },
  );
}

HomeCellState _onAction(HomeCellState state, Action action) {
  final HomeCellState newState = state.clone();
  return newState;
}
