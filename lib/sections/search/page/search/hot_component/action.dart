import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';

enum SearchHotAction { action, onTapItem }

class SearchHotActionCreator {
  static Action onAction() {
    return const Action(SearchHotAction.action);
  }

  static Action onTapItemAction(HotSearchItem item) {
    return Action(SearchHotAction.onTapItem, payload: item);
  }
}
