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
    HomeAction.onTapBanner: _onTapBanner,
    HomeAction.onTapCell: _onTapCell,
  });
}

void _initState(Action action, Context<HomeState> ctx) async {
  int page = 0;
  HomeBannerWrap? bannerWrap = await CommonService.getHomeBanner();

  HomeArticleWrap? articleWrap = await CommonService.getHomeArticle(page: page);

  ctx.dispatch(HomeActionCreator.didFetchAction(
      bannerWrap, articleWrap!.data!.articleList));
}

///banner点击
void _onTapBanner(Action action, Context<HomeState> ctx) {
  final HomeBannerBean bannerBean = action.payload;
  print(">>>>>>>>>banner:${bannerBean.title ?? "123"}");
}

void _onTapCell(Action action, Context<HomeState> ctx) {
  final HomeArticleBean articleBean = action.payload;
  print(">>>>>>>>>>>cell:${articleBean.title}");
}

void _onAction(Action action, Context<HomeState> ctx) {}
