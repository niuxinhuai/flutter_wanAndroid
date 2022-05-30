import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

enum KnowledgeAction { action, onTapCell, didFetch }

class KnowledgeActionCreator {
  static Action onAction() {
    return const Action(KnowledgeAction.action);
  }

  static Action onTapCellAction(KnowledgeStage stage) {
    return Action(KnowledgeAction.onTapCell, payload: stage);
  }

  static Action didFetchAction(KnowledgeArticleWrap? wrap) {
    return Action(KnowledgeAction.didFetch, payload: wrap);
  }
}
