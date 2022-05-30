import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge_article/child/page.dart';

class KnowledgeArticleState implements Cloneable<KnowledgeArticleState> {
  KnowledgeStage stage = KnowledgeStage();
  int curIndex = 0;
  TabController? tabController;
  List<Widget> children = [];
  List<String> tabTitles = [];

  @override
  KnowledgeArticleState clone() {
    return KnowledgeArticleState()
      ..stage = stage
      ..curIndex = curIndex
      ..tabController = tabController
      ..children = children
      ..tabTitles = tabTitles;
  }
}

KnowledgeArticleState initState(Map<String, dynamic>? args) {
  KnowledgeStage stage = KnowledgeStage.fromJson(args!);

  List<Widget> children = [];
  List<String> tabTitles = [];
  for (KnowledgeChildItem item in stage.children!) {
    children.add(
        KnowledgeArticleSegmentPage().buildPage({"params": item.toJson()}));
    tabTitles.add(item.name ?? "");
  }

  return KnowledgeArticleState()
    ..stage = stage
    ..children = children
    ..tabTitles = tabTitles;
}
