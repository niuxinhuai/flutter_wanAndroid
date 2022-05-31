import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/models/db/db_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchHistoryState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchHistoryState>>{
      SearchHistoryAction.action: _onAction,
      SearchHistoryAction.didFeatchData: _didFeatchData,
    },
  );
}

SearchHistoryState _didFeatchData(SearchHistoryState state, Action action) {
  final List<UserSearchLog> logs = action.payload;
  final SearchHistoryState newState = state.clone();
  newState.logs = logs;
  return newState;
}

SearchHistoryState _onAction(SearchHistoryState state, Action action) {
  final SearchHistoryState newState = state.clone();
  return newState;
}
