import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';

class SearchHotState implements Cloneable<SearchHotState> {
  SearchWrap? searchWrap;

  @override
  SearchHotState clone() {
    return SearchHotState()..searchWrap = searchWrap;
  }
}

SearchHotState initState(Map<String, dynamic> args) {
  return SearchHotState();
}
