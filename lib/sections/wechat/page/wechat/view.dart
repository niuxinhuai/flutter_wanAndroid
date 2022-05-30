import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/widget/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WeChatArticleState state, Dispatch dispatch, ViewService viewService) {
  if (state.children.isEmpty) {
    return Container(
      width: 0,
      height: 0,
    );
  }
  return TabBarSegmentController(
    useScaffold: true,
    navgationTitle: "公众号",
    onTap: (int index) {},
    backgroundColor: CommonColors.foregroundColor,
    tabBarIsScrollable: true,
    tabTitles: state.tabTitles.toList(),
    children: state.children.toList(),
    actions: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(WeChatArticleActionCreator.onTapSearchAction()),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Icon(Icons.search),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Icon(Icons.mail),
      ),
    ],
  );
}
