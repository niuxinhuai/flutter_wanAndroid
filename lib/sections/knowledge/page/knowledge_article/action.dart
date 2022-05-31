import 'package:fish_redux/fish_redux.dart';

enum KnowledgeArticleAction { action }

class KnowledgeArticleActionCreator {
  static Action onAction() {
    return const Action(KnowledgeArticleAction.action);
  }
}
