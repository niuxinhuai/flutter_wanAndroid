import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/action.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/right_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<NavigationLeftState>? buildEffect() {
  return combineEffects(<Object, Effect<NavigationLeftState>>{
    NavigationLeftAction.onTapItem: _onTapItem,
  });
}

void _onTapItem(Action action, Context<NavigationLeftState> ctx) {
  final Tuple2 tuple2 = action.payload;
  ctx.state.stages.forEach((element) {
    element.selected = false;
  });

  ctx.state.curIndex = tuple2.i1;
  ctx.state.stages[ctx.state.curIndex].selected = true;

  ///TODO：直接写左右组件刷新，会出现左侧组件不刷新de问题
  ctx.dispatch(NavigationArticleActionCreator.didRefreshPageAction());
  ctx.dispatch(NavigationRightActionCreator.didRefreshAction());
}
