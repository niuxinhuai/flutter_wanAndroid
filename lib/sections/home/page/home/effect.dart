import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<HomeState> ctx) async {
  int page = 0;
  HomeBannerWrap? bannerWrap = await CommonService.getHomeBanner();

  HomeArticleWrap? articleWrap = await CommonService.getHomeArticle(page: page);

  ctx.dispatch(HomeActionCreator.didFetchAction(
      bannerWrap, articleWrap!.data!.articleList));
}

void _onAction(Action action, Context<HomeState> ctx) {}
