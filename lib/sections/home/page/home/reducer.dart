import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState>? buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.didFetch: _didFetchAction,
    },
  );
}

HomeState _didFetchAction(HomeState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final HomeState newState = state.clone();
  newState.bannerWrap = tuple2.i0;
  newState.beans = tuple2.i1;
  return newState;
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}
