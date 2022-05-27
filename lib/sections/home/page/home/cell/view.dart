import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/page/home/action.dart';
import 'package:flutter_wanandroid/sections/home/widget/article_item.dart';

Widget buildView(
    HomeArticleBean state, Dispatch dispatch, ViewService viewService) {
  if (state.envelopePic != null && state.envelopePic!.isNotEmpty) {
    print(">>>>>>>>url:${state.envelopePic}");
  }
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(HomeActionCreator.onTapCellAction(state)),
    child: ArticleItemWidget(
      articleBean: state,
    ),
  );
}
