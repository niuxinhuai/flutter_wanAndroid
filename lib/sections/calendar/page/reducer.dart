import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<CalendarState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CalendarState>>{
      CalendarAction.action: _onAction,
      CalendarAction.didFetch: _didFetchAction,
    },
  );
}

CalendarState _didFetchAction(CalendarState state, Action action) {
  final CalendarWrap calendarWrap = action.payload;
  final CalendarState newState = state.clone();
  newState.calendarWrap = calendarWrap;
  newState.loadingState = LoadingState.success;
  return newState;
}

CalendarState _onAction(CalendarState state, Action action) {
  final CalendarState newState = state.clone();
  return newState;
}
