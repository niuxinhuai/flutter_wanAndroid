import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

class ProjectArticleState implements Cloneable<ProjectArticleState> {
  List<KnowledgeChildItem> items = [];
  List<Widget> children = [];
  List<String> tabTitles = [];
  @override
  ProjectArticleState clone() {
    return ProjectArticleState()
      ..items = items
      ..children = children
      ..tabTitles = tabTitles;
  }
}

ProjectArticleState initState(Map<String, dynamic>? args) {
  return ProjectArticleState();
}
