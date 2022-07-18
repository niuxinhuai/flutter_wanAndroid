import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AMapHomeState>? buildReducer() {
  return asReducer(
    <Object, Reducer<AMapHomeState>>{
      AMapHomeAction.action: _onAction,
      AMapHomeAction.didReload: _didReload,
    },
  );
}

AMapHomeState _onAction(AMapHomeState state, Action action) {
  final AMapHomeState newState = state.clone();
  return newState;
}

AMapHomeState _didReload(AMapHomeState state, Action action) {
  final AMapHomeState newState = state.clone();
  return newState;
}
