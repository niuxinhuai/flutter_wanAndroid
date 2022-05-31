import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/models/db/db_model.dart';

enum SearchHistoryAction {
  action,
  onTapItem,
  onRefresh,
  onClean,
  didFeatchData
}

class SearchHistoryActionCreator {
  static Action onAction() {
    return const Action(SearchHistoryAction.action);
  }

  static Action onTapItemAction(UserSearchLog log) {
    return Action(SearchHistoryAction.onTapItem, payload: log);
  }

  static Action onRefreshAction() {
    return const Action(SearchHistoryAction.onRefresh);
  }

  static Action onCleanAction() {
    return const Action(SearchHistoryAction.onClean);
  }

  static Action didFeatchDataAction(List<UserSearchLog> logs) {
    return Action(SearchHistoryAction.didFeatchData, payload: logs);
  }
}
