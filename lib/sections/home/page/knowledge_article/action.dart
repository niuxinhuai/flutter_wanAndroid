import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum KnowledgeArticleAction { action }

class KnowledgeArticleActionCreator {
  static Action onAction() {
    return const Action(KnowledgeArticleAction.action);
  }
}
