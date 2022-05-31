import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge_article/child/page.dart';
import 'package:flutter_wanandroid/widget/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchResultState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(state.keyWords ?? ""),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(SearchResultActionCreator.onClickBackAction()),
        child: Container(
          width: 44,
          height: 44,
          child: Icon(Icons.arrow_back),
        ),
      ),
    ),
    backgroundColor: CommonColors.foregroundColor,
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    SearchResultState state, Dispatch dispatch, ViewService viewService) {
  if (state.keyWords == null) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'keywords不能为空哦～',
        style: GpOtherTheme.size17(viewService.context)!
            .copyWith(color: CommonColors.textColor999),
      ),
    );
  }
  return KeepAliveWidget(
    childWidget: KnowledgeArticleSegmentPage().buildPage(
        {'type': ArticlePageType.search, 'keywords': state.keyWords}),
  );
}
