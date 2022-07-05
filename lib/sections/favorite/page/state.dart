import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoriteArticleState implements Cloneable<FavoriteArticleState> {
  HomeArticleWrap? wrap;
  List<HomeArticleBean> beans = [];
  int page = 0;
  int page_size = 10;
  RefreshController? refreshController;
  bool? loadNoMoreData;
  LoadingState? loadingState;

  @override
  FavoriteArticleState clone() {
    return FavoriteArticleState()
      ..wrap = wrap
      ..beans = beans
      ..page = page
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData
      ..loadingState = loadingState
      ..page_size = page_size;
  }
}

FavoriteArticleState initState(Map<String, dynamic>? args) {
  return FavoriteArticleState()
    ..page = 0
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false
    ..loadingState = LoadingState.isLoading;
}
