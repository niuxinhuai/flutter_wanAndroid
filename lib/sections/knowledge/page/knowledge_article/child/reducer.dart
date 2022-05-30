import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

import 'action.dart';
import 'state.dart';

Reducer<KnowledgeArticleSegmentState>? buildReducer() {
  return asReducer(
    <Object, Reducer<KnowledgeArticleSegmentState>>{
      KnowledgeArticleSegmentAction.action: _onAction,
      KnowledgeArticleSegmentAction.didFetchData: _didFetchData,
    },
  );
}

KnowledgeArticleSegmentState _onAction(
    KnowledgeArticleSegmentState state, Action action) {
  final KnowledgeArticleSegmentState newState = state.clone();
  return newState;
}

KnowledgeArticleSegmentState _didFetchData(
    KnowledgeArticleSegmentState state, Action action) {
  final List<HomeArticleBean> beans = action.payload;

  final KnowledgeArticleSegmentState newState = state.clone();
  if (beans.length != 0) {
    newState.items.addAll(beans);
    newState.refreshController!.loadComplete();
    newState.page++;
  } else {
    newState.refreshController!.loadNoData();
    newState.loadNoMoreData = true;
  }
  return newState;
}
