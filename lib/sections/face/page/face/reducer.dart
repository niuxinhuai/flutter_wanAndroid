import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FaceAuthState>? buildReducer() {
  return asReducer(
    <Object, Reducer<FaceAuthState>>{
      FaceAuthAction.action: _onAction,
    },
  );
}

FaceAuthState _onAction(FaceAuthState state, Action action) {
  final FaceAuthState newState = state.clone();
  return newState;
}
