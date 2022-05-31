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
  String? keywords; //只在搜索下才有

  @override
  KnowledgeArticleSegmentState clone() {
    return KnowledgeArticleSegmentState()
      ..item = item
      ..page = page
      ..cid = cid
      ..items = items
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData
      ..type = type
      ..keywords = keywords;
  }
}

KnowledgeArticleSegmentState initState(Map<String, dynamic>? args) {
  final ArticlePageType type = args!["type"];
  KnowledgeChildItem childItem = KnowledgeChildItem();
  String keywords = "";
  if (type == ArticlePageType.search) {
    keywords = args["keywords"];
  } else {
    childItem = KnowledgeChildItem.fromJson(args["params"]);
  }

  return KnowledgeArticleSegmentState()
    ..item = childItem
    ..cid = childItem.id ?? 0
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false
    ..type = type
    ..keywords = keywords;
}
