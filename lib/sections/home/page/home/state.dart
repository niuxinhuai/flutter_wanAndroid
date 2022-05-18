import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeState extends ItemListLike implements Cloneable<HomeState> {
  HomeBannerWrap? bannerWrap;
  List<HomeArticleBean>? beans = [];
  int? page;
  RefreshController? refreshController;
  bool? loadNoMoreData;

  @override
  HomeState clone() {
    return HomeState()
      ..bannerWrap = bannerWrap
      ..beans = beans
      ..page = page
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData;
  }

  @override
  Object getItemData(int index) {
    if (index == 0 && bannerWrap != null) return bannerWrap!;
    return beans![index];
  }

  @override
  String getItemType(int index) {
    if (index == 0 && bannerWrap != null) return "header";
    return "cell";
  }

  @override
  int get itemCount => beans?.length ?? 0;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    beans![index] = data as HomeArticleBean;
    return this;
  }
}

HomeState initState(Map<String, dynamic>? args) {
  return HomeState()
    ..page = 0
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false;
}
