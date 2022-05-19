import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:flutter_wanandroid/utils/string_util.dart';
import 'package:html_unescape/html_unescape.dart';

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

  List<HomeArticleBean>? topBeans = await CommonService.getTopArticle();

  List<HomeArticleBean> beans = [];
  if (topBeans != null && topBeans.length != 0) {
    beans.addAll(topBeans);
  }

  if (articleWrap?.data?.articleList != null &&
      articleWrap?.data?.articleList!.length != 0) {
    beans.addAll(articleWrap!.data!.articleList!);
  }

  if (bannerWrap?.data != null && bannerWrap!.data!.length != 0) {
    beans.insert(0, HomeArticleBean());
  }
  ctx.dispatch(HomeActionCreator.didFetchAction(bannerWrap, beans));
}

///banner点击
void _onTapBanner(Action action, Context<HomeState> ctx) {
  final HomeBannerBean bannerBean = action.payload;
  print(">>>>>>>>>banner:${bannerBean.title ?? "123"}");
}

void _onTapCell(Action action, Context<HomeState> ctx) {
  final HomeArticleBean articleBean = action.payload;

  print(
      ">>>>>>>>>>>cell:${articleBean.title}  >>>>>>des:${StringUtils.stripHtmlIfNeeded(articleBean.desc ?? "空").trim()}");
}

void _onAction(Action action, Context<HomeState> ctx) {}
