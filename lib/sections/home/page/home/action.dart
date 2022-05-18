import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';

//TODO replace with your own action
enum HomeAction { action, onLoading, didFetch }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onLoadingAction() {
    return const Action(HomeAction.onLoading);
  }

  static Action didFetchAction(
      HomeBannerWrap? bannerWrap, List<HomeArticleBean>? beans) {
    return Action(HomeAction.didFetch, payload: Tuple2(bannerWrap, beans));
  }
}
