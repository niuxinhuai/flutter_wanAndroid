import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';

enum SearchArticleAction { action, onTapClearWords, onSubmit, didFeatchData }

class SearchArticleActionCreator {
  static Action onAction() {
    return const Action(SearchArticleAction.action);
  }

  static Action onTapClearWordsAction() {
    return const Action(SearchArticleAction.onTapClearWords);
  }

  static Action onSubmitAction(String text) {
    return Action(SearchArticleAction.onSubmit, payload: text);
  }

  static Action didFeatchDataAction(SearchWrap searchWrap) {
    return Action(SearchArticleAction.didFeatchData, payload: searchWrap);
  }
}
