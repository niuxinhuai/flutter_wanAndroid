import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchArticleState>>{
      SearchArticleAction.action: _onAction,
      SearchArticleAction.didFeatchData: _didFeatchData,
    },
  );
}

SearchArticleState _didFeatchData(SearchArticleState state, Action action) {
  final SearchWrap searchWrap = action.payload;
  final SearchArticleState newState = state.clone();
  newState.searchWrap = searchWrap;
  newState.hotState?.searchWrap = searchWrap;
  return newState;
}

SearchArticleState _onAction(SearchArticleState state, Action action) {
  final SearchArticleState newState = state.clone();
  return newState;
}
