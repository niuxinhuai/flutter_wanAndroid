import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
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
