import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';
import 'package:flutter_wanandroid/sections/search/page/search/action.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchHotState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchHotState>>{
    SearchHotAction.action: _onAction,
    SearchHotAction.onTapItem: _onTapItem,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SearchHotState> ctx) {}

void _onTapItem(Action action, Context<SearchHotState> ctx) {
  final HotSearchItem item = action.payload;
  ctx.dispatch(SearchArticleActionCreator.onSubmitAction(item.name ?? ""));
}

void _onAction(Action action, Context<SearchHotState> ctx) {}
