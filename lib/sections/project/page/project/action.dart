import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

enum ProjectArticleAction { action, onTapSearch, didFeatchData }

class ProjectArticleActionCreator {
  static Action onAction() {
    return const Action(ProjectArticleAction.action);
  }

  static Action onTapSearchAction() {
    return const Action(ProjectArticleAction.onTapSearch);
  }

  static Action didFeatchDataAction(List<KnowledgeChildItem> items) {
    return Action(ProjectArticleAction.didFeatchData, payload: items);
  }
}
