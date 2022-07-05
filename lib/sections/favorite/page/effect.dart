import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'action.dart';
import 'state.dart';

Effect<FavoriteArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<FavoriteArticleState>>{
    FavoriteArticleAction.action: _onAction,
    Lifecycle.initState: _initState,
    FavoriteArticleAction.onLoading: _onLoading,
    FavoriteArticleAction.onTapCell: _onTapCell,
    FavoriteArticleAction.onTapUnCollectCell: _onTapUnCollectCell,
  });
}

void _onAction(Action action, Context<FavoriteArticleState> ctx) {}

void _initState(Action action, Context<FavoriteArticleState> ctx) async {
  HomeArticleWrap wrap =
      await CommonService.collectList(ctx.state.page, ctx.state.page_size);
  List<HomeArticleBean> beans = [];

  if (wrap.data?.articleList != null && wrap.data?.articleList!.length != 0) {
    beans.addAll(wrap.data!.articleList!);
  }

  ctx.dispatch(FavoriteArticleActionCreator.didFetchDataAction(beans));
}

void _onLoading(Action action, Context<FavoriteArticleState> ctx) async {
  HomeArticleWrap wrap =
      await CommonService.collectList(ctx.state.page, ctx.state.page_size);
  List<HomeArticleBean> beans = [];

  if (wrap.data?.articleList != null && wrap.data?.articleList!.length != 0) {
    beans.addAll(wrap.data!.articleList!);
  }
  ctx.dispatch(FavoriteArticleActionCreator.didLoadingAction(beans));
}

void _onTapCell(Action action, Context<FavoriteArticleState> ctx) {
  final HomeArticleBean articleBean = action.payload;

  ARouter.open(ctx.context, RouterKeys.webView,
      params: {"url": articleBean.link ?? ""});
}

void _onTapUnCollectCell(Action action, Context<FavoriteArticleState> ctx) {
  int id = action.payload;
  ctx.dispatch(FavoriteArticleActionCreator.didRemoveArticleItemAction(id));
}
