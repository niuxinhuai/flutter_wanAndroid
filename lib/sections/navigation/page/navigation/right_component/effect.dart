import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'action.dart';
import 'state.dart';

Effect<NavigationRightState>? buildEffect() {
  return combineEffects(<Object, Effect<NavigationRightState>>{
    NavigationRightAction.onTapItem: _onTapItem,
  });
}

void _onTapItem(Action action, Context<NavigationRightState> ctx) {
  final HomeArticleBean bean = action.payload;
  ARouter.open(ctx.context, RouterKeys.webView,
      params: {"url": bean.link ?? ""});
}
