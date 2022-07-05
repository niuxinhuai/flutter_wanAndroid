import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

enum FavoriteArticleAction {
  action,
  onTapCell,
  onTapUnCollectCell,
  onLoading,
  didLoading,
  didFetchData,
  didRemoveArticleItem,
}

class FavoriteArticleActionCreator {
  static Action onAction() {
    return const Action(FavoriteArticleAction.action);
  }

  static Action onTapCellAction(HomeArticleBean bean) {
    return Action(FavoriteArticleAction.onTapCell, payload: bean);
  }

  static Action onTapUnCollectCellAction(int id) {
    return Action(FavoriteArticleAction.onTapUnCollectCell, payload: id);
  }

  static Action didFetchDataAction(List<HomeArticleBean> bean) {
    return Action(FavoriteArticleAction.didFetchData, payload: bean);
  }

  static Action onLoadingAction() {
    return const Action(FavoriteArticleAction.onLoading);
  }

  static Action didLoadingAction(List<HomeArticleBean> bean) {
    return Action(FavoriteArticleAction.didLoading, payload: bean);
  }

  static Action didRemoveArticleItemAction(int id) {
    return Action(FavoriteArticleAction.didRemoveArticleItem, payload: id);
  }
}
