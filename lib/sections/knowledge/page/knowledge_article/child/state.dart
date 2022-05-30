import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KnowledgeArticleSegmentState
    implements Cloneable<KnowledgeArticleSegmentState> {
  List<HomeArticleBean> items = [];
  KnowledgeChildItem? item;
  int page = 0;
  int cid = 0;
  ArticlePageType type = ArticlePageType.knowledge;
  RefreshController? refreshController;
  bool? loadNoMoreData;

  @override
  KnowledgeArticleSegmentState clone() {
    return KnowledgeArticleSegmentState()
      ..item = item
      ..page = page
      ..cid = cid
      ..items = items
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData
      ..type = type;
  }
}

KnowledgeArticleSegmentState initState(Map<String, dynamic>? args) {
  final KnowledgeChildItem childItem =
      KnowledgeChildItem.fromJson(args!["params"]);
  final ArticlePageType type = args["type"];
  return KnowledgeArticleSegmentState()
    ..item = childItem
    ..cid = childItem.id ?? 0
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false
    ..type = type;
}
