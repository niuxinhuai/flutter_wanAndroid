import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchResultState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchResultState>>{
    SearchResultAction.action: _onAction,
    Lifecycle.initState: _initState,
    SearchResultAction.onClickBack: _onClickBack,
  });
}

void _initState(Action action, Context<SearchResultState> ctx) {}

void _onClickBack(Action action, Context<SearchResultState> ctx) {
  ARouter.close(ctx.context, result: {'refresh': true});
}

void _onAction(Action action, Context<SearchResultState> ctx) {}
