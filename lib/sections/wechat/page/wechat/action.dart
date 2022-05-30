import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

enum WeChatArticleAction { action, onTapSearch, didFeatchData }

class WeChatArticleActionCreator {
  static Action onAction() {
    return const Action(WeChatArticleAction.action);
  }

  static Action onTapSearchAction() {
    return const Action(WeChatArticleAction.onTapSearch);
  }

  static Action didFeatchDataAction(List<KnowledgeChildItem> beans) {
    return Action(WeChatArticleAction.didFeatchData, payload: beans);
  }
}
