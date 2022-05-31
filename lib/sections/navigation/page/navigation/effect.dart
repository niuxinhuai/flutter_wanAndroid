import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';
import 'action.dart';
import 'state.dart';

Effect<NavigationArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<NavigationArticleState>>{
    NavigationArticleAction.action: _onAction,
    Lifecycle.initState: _initState,
    NavigationArticleAction.onTapSearch: _onTapSearch,
  });
}

void _initState(Action action, Context<NavigationArticleState> ctx) async {
  NavigationArticleWrap articleWrap = await CommonService.getNavigationData();
  ctx.dispatch(NavigationArticleActionCreator.didFeatchDataAction(articleWrap));
}

///点击搜索
void _onTapSearch(Action action, Context<NavigationArticleState> ctx) {
  ARouter.open(ctx.context, RouterKeys.search);
}

void _onAction(Action action, Context<NavigationArticleState> ctx) {}
