import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CustomWebViewState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CustomWebViewState>>{
      CustomWebViewAction.action: _onAction,
    },
  );
}

CustomWebViewState _onAction(CustomWebViewState state, Action action) {
  final CustomWebViewState newState = state.clone();
  return newState;
}
