import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState>? buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.didFetch: _didFetchAction,
      HomeAction.didLoading: _didLoading,
      HomeAction.didRefresh: _didRefresh,
    },
  );
}

HomeState _didFetchAction(HomeState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final HomeState newState = state.clone();
  newState.bannerWrap = tuple2.i0;
  newState.beans = tuple2.i1;
  newState.page++;
  return newState;
}

HomeState _didLoading(HomeState state, Action action) {
  final HomeArticleWrap? wrap = action.payload;
  final HomeState newState = state.clone();
  if (wrap?.data?.articleList != null && wrap?.data?.articleList!.length != 0) {
    newState.beans!.addAll(wrap!.data!.articleList!);
    newState.refreshController!.loadComplete();
    newState.page++;
  } else {
    newState.refreshController!.loadNoData();
    newState.loadNoMoreData = true;
  }
  return newState;
}

HomeState _didRefresh(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}
