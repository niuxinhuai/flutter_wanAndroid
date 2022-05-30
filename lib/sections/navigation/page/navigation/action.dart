import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';

enum NavigationArticleAction {
  action,
  onTapSearch,
  didFeatchData,
  didRefreshPage
}

class NavigationArticleActionCreator {
  static Action onAction() {
    return const Action(NavigationArticleAction.action);
  }

  static Action onTapSearchAction() {
    return const Action(NavigationArticleAction.onTapSearch);
  }

  static Action didFeatchDataAction(NavigationArticleWrap articleWrap) {
    return Action(NavigationArticleAction.didFeatchData, payload: articleWrap);
  }

  static Action didRefreshPageAction() {
    return const Action(NavigationArticleAction.didRefreshPage);
  }
}
