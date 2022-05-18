import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/sections/application/models/application.dart';
import 'package:flutter_wanandroid/sections/home/page/home/page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ApplicationState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage().buildPage({}),
        Container(
          alignment: Alignment.center,
          child: Text('问答'),
        ),
        Container(
          alignment: Alignment.center,
          child: Text('体系'),
        ),
        Container(
          alignment: Alignment.center,
          child: Text('我的'),
        )
      ],
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
