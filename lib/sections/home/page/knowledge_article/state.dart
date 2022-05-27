import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/knowledge/knowledge.dart';

class KnowledgeArticleState implements Cloneable<KnowledgeArticleState> {
  KnowledgeStage stage = KnowledgeStage();
  int curIndex = 0;
  TabController? tabController;

  @override
  KnowledgeArticleState clone() {
    return KnowledgeArticleState()
      ..stage = stage
      ..curIndex = curIndex
      ..tabController = tabController;
  }
}

KnowledgeArticleState initState(Map<String, dynamic>? args) {
  KnowledgeStage stage = KnowledgeStage.fromJson(args!);

  return KnowledgeArticleState()..stage = stage;
}
