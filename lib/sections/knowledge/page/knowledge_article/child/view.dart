import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/widget/article_item.dart';
import 'package:flutter_wanandroid/widget/refresh_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(KnowledgeArticleSegmentState state, Dispatch dispatch,
    ViewService viewService) {
  if (state.items.length == 0) {
    return Container(
      width: 0,
      height: 0,
    );
  }
  return CustomRefreshIndicator(
    controller: state.refreshController,
    enablePullUp: state.loadNoMoreData! ? false : true,
    onLoading: () =>
        dispatch(KnowledgeArticleSegmentActionCreator.onLoadingAction()),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 0, bottom: 20),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: state.items.length,
      itemBuilder: (BuildContext context, int index) {
        HomeArticleBean bean = state.items[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => dispatch(
              KnowledgeArticleSegmentActionCreator.onTapArticleAction(bean)),
          child: ArticleItemWidget(
            articleBean: bean,
          ),
        );
      },
    ),
  );
}
