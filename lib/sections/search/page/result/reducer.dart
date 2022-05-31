import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchResultState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchResultState>>{
      SearchResultAction.action: _onAction,
    },
  );
}

SearchResultState _onAction(SearchResultState state, Action action) {
  final SearchResultState newState = state.clone();
  return newState;
}
