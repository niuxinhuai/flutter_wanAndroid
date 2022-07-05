import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavoriteArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<FavoriteArticleState>>{
      FavoriteArticleAction.action: _onAction,
      FavoriteArticleAction.didFetchData: _didFetchData,
      FavoriteArticleAction.didLoading: _didLoading,
      FavoriteArticleAction.didRemoveArticleItem: _didRemoveArticleItem,
    },
  );
}

FavoriteArticleState _onAction(FavoriteArticleState state, Action action) {
  final FavoriteArticleState newState = state.clone();
  return newState;
}

FavoriteArticleState _didFetchData(FavoriteArticleState state, Action action) {
  List<HomeArticleBean> beans = action.payload;
  final FavoriteArticleState newState = state.clone();
  newState.beans = beans;
  newState.page++;
  newState.loadingState = LoadingState.success;
  return newState;
}

FavoriteArticleState _didLoading(FavoriteArticleState state, Action action) {
  List<HomeArticleBean> beans = action.payload;
  final FavoriteArticleState newState = state.clone();
  if (beans.length != 0) {
    newState.beans.addAll(beans);
    newState.refreshController!.loadComplete();
    newState.page++;
  } else {
    newState.refreshController!.loadNoData();
    newState.loadNoMoreData = true;
  }
  return newState;
}

FavoriteArticleState _didRemoveArticleItem(
    FavoriteArticleState state, Action action) {
  final int id = action.payload;
  final FavoriteArticleState newState = state.clone();
  if (newState.beans.length != 0) {
    newState.beans.removeWhere((element) => element.originId == id);
  }
  return newState;
}
