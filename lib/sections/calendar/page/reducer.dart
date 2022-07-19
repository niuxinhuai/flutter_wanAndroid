import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CalendarState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CalendarState>>{
      CalendarAction.action: _onAction,
    },
  );
}

CalendarState _onAction(CalendarState state, Action action) {
  final CalendarState newState = state.clone();
  return newState;
}
