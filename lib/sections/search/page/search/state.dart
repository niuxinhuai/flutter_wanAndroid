import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';
import 'package:flutter_wanandroid/sections/search/page/search/history_component/state.dart';
import 'package:flutter_wanandroid/sections/search/page/search/hot_component/state.dart';

class SearchArticleState implements Cloneable<SearchArticleState> {
  SearchWrap? searchWrap;
  TextEditingController? textEditingController;
  SearchHotState? hotState;
  SearchHistoryState? historyState;

  @override
  SearchArticleState clone() {
    return SearchArticleState()
      ..textEditingController = textEditingController
      ..searchWrap = searchWrap
    ..hotState = hotState
    ..historyState = historyState;
  }
}

SearchArticleState initState(Map<String, dynamic>? args) {
  return SearchArticleState()..textEditingController = TextEditingController()
  ..hotState = SearchHotState()
  ..historyState = SearchHistoryState();
}

///热搜组件连接器
class SearchHotConnector
    extends ConnOp<SearchArticleState, SearchHotState> {
  @override
  SearchHotState? get(SearchArticleState? state) {
    return state?.hotState;
  }

  @override
  void set(SearchArticleState state, SearchHotState subState) {
    state.hotState = subState;
  }
}

///历史组建连接器
class SearchHistoryConnector
    extends ConnOp<SearchArticleState, SearchHistoryState> {
  @override
  SearchHistoryState? get(SearchArticleState? state) {
    return state?.historyState;
  }

  @override
  void set(SearchArticleState state, SearchHistoryState subState) {
    state.historyState = subState;
  }
}
