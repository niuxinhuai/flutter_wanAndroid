import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeCellState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeCellState>>{
    HomeCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeCellState> ctx) {}
