import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge_article/child/page.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProjectArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectArticleState>>{
      ProjectArticleAction.action: _onAction,
      ProjectArticleAction.didFeatchData: _didFeatchData,
    },
  );
}

ProjectArticleState _didFeatchData(ProjectArticleState state, Action action) {
  final List<KnowledgeChildItem> items = action.payload;
  final ProjectArticleState newState = state.clone();
  newState.items = items;
  if (items.isNotEmpty) {
    List<String> tabTitles = [];
    List<P.Widget> children = [];
    for (KnowledgeChildItem item in items) {
      children.add(KnowledgeArticleSegmentPage().buildPage(
          {"params": item.toJson(), "type": ArticlePageType.project}));
      tabTitles.add(item.name ?? "");
    }
    newState.children = children;
    newState.tabTitles = tabTitles;
  }
  return newState;
}

ProjectArticleState _onAction(ProjectArticleState state, Action action) {
  final ProjectArticleState newState = state.clone();
  return newState;
}
