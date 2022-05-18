import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeHeaderState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeHeaderState>>{
    HomeHeaderAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeHeaderState> ctx) {}
