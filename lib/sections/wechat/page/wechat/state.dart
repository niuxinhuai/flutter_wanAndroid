import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

class WeChatArticleState implements Cloneable<WeChatArticleState> {
  List<KnowledgeChildItem> beans = [];
  List<Widget> children = [];
  List<String> tabTitles = [];

  @override
  WeChatArticleState clone() {
    return WeChatArticleState()
      ..beans = beans
      ..children = children
      ..tabTitles = tabTitles;
  }
}

WeChatArticleState initState(Map<String, dynamic>? args) {
  return WeChatArticleState();
}
