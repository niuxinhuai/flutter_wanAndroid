import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';

enum HomeAction {
  action,
  onLoading,
  onTapBanner,
  onTapCell,
  didFetch,
  didLoading
}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onLoadingAction() {
    return const Action(HomeAction.onLoading);
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
}
