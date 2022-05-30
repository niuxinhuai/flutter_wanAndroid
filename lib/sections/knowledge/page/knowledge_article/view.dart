import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/widget/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    KnowledgeArticleState state, Dispatch dispatch, ViewService viewService) {
  return TabBarSegmentController(
      useScaffold: true,
      navgationTitle: state.stage.name ?? "",
      onTap: (int index) {},
      backgroundColor: CommonColors.foregroundColor,
      tabBarIsScrollable: true,
      tabTitles: state.tabTitles.toList(),
      children: state.children.toList());
}

PreferredSizeWidget _buildBottomBar(
    KnowledgeArticleState state, Dispatch dispatch, ViewService viewService) {
  return TabBar(
    controller: state.tabController,
    isScrollable: true,
    tabs: state.stage.children!.map((e) => Text(e.name ?? "")).toList(),
    physics: NeverScrollableScrollPhysics(),
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: CommonColors.primary),
        insets: EdgeInsets.only(left: 7, right: 7)),
    labelStyle: GpOtherTheme.size15(viewService.context),
    unselectedLabelStyle: GpOtherTheme.size15(viewService.context),
    indicatorSize: TabBarIndicatorSize.label,
  );
}
