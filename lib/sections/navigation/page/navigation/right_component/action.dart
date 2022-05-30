import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

enum NavigationRightAction { onTapItem, didRefresh }

class NavigationRightActionCreator {
  static Action onTapItemAction(HomeArticleBean bean) {
    return Action(NavigationRightAction.onTapItem, payload: bean);
  }

  static Action didRefreshAction() {
    return Action(NavigationRightAction.didRefresh);
  }
}
