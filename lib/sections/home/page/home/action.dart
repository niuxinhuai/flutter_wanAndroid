import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';

enum HomeAction {
  action,
  onTapLeading,
  onLoading,
  onTapBanner,
  onTapCell,
  didFetch,
  didLoading,
  didRefresh,
}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onLoadingAction() {
    return const Action(HomeAction.onLoading);
  }

  static Action ononTapLeadingAction() {
    return const Action(HomeAction.onTapLeading);
  }

  static Action onTapBannerAction(HomeBannerBean bannerBean) {
    return Action(HomeAction.onTapBanner, payload: bannerBean);
  }

  static Action onTapCellAction(HomeArticleBean articleBean) {
    return Action(HomeAction.onTapCell, payload: articleBean);
  }

  static Action didFetchAction(
      HomeBannerWrap? bannerWrap, List<HomeArticleBean>? beans) {
    return Action(HomeAction.didFetch, payload: Tuple2(bannerWrap, beans));
  }

  static Action didLoadingAction(HomeArticleWrap? wrap) {
    return Action(HomeAction.didLoading, payload: wrap);
  }

  static Action didRefreshAction() {
    return const Action(HomeAction.didRefresh);
  }
}
