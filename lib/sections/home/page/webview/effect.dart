import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CustomWebViewState>? buildEffect() {
  return combineEffects(<Object, Effect<CustomWebViewState>>{
    CustomWebViewAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CustomWebViewState> ctx) {}
