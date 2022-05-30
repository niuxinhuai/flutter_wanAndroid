import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as P;
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge_article/child/page.dart';

import 'action.dart';
import 'state.dart';

Reducer<WeChatArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<WeChatArticleState>>{
      WeChatArticleAction.action: _onAction,
      WeChatArticleAction.didFeatchData: _didFeatchData,
    },
  );
}

WeChatArticleState _didFeatchData(WeChatArticleState state, Action action) {
  final List<KnowledgeChildItem> beans = action.payload;
  final WeChatArticleState newState = state.clone();
  newState.beans = beans;
  if (beans.isNotEmpty) {
    List<String> tabTitles = [];
    List<P.Widget> children = [];
    for (KnowledgeChildItem item in beans) {
      children.add(KnowledgeArticleSegmentPage().buildPage(
          {"params": item.toJson(), "type": ArticlePageType.wxArticle}));
      tabTitles.add(item.name ?? "");
    }
    newState.children = children;
    newState.tabTitles = tabTitles;
  }
  return newState;
}

WeChatArticleState _onAction(WeChatArticleState state, Action action) {
  final WeChatArticleState newState = state.clone();
  return newState;
}
