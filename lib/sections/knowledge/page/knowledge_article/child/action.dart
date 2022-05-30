import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

enum KnowledgeArticleSegmentAction {
  action,
  onLoading,
  onTapArticle,
  didFetchData
}

class KnowledgeArticleSegmentActionCreator {
  static Action onAction() {
    return const Action(KnowledgeArticleSegmentAction.action);
  }

  static Action onLoadingAction() {
    return const Action(KnowledgeArticleSegmentAction.onLoading);
  }

  static Action onTapArticleAction(HomeArticleBean bean) {
    return Action(KnowledgeArticleSegmentAction.onTapArticle, payload: bean);
  }

  static Action didFetchDataAction(List<HomeArticleBean> beans) {
    return Action(KnowledgeArticleSegmentAction.didFetchData, payload: beans);
  }
}
