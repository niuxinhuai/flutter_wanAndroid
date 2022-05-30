import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/sections/application/models/application.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ApplicationState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      physics: NeverScrollableScrollPhysics(),
      children: state.children.toList(),
      onPageChanged: (int index) =>
          dispatch(ApplicationActionCreator.onPageChangedAction(index)),
      controller: state.pageController,
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: ApplicationModule.bottomTabs,
      currentIndex: state.page!,
      fixedColor: CommonColors.primary,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) =>
          dispatch(ApplicationActionCreator.onTapAction(index)),
    ),
  );
}
