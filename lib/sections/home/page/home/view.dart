import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/page/drawer/page.dart';
import 'package:flutter_wanandroid/widget/refresh_indicator.dart';
import 'package:flutter_wanandroid/widget/smart_drawer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: state.globalKey,
    appBar: AppBar(
      title: Text("首页"),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(HomeActionCreator.ononTapLeadingAction()),
        child: Container(
          width: 44,
          height: 44,
          child: Icon(Icons.menu),
        ),
      ),
    ),
    body: _buildBody(state, dispatch, viewService),
    drawer: SmartDrawer(
      widthPercent: 0.7,
      semanticLabel: "Label",
      child: HomeDrawerPage().buildPage({}),
    ),
  );
}

Widget _buildBody(HomeState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter? adapter = viewService.buildAdapter();
  return CustomRefreshIndicator(
    controller: state.refreshController,
    enablePullUp: state.loadNoMoreData! ? false : true,
    onLoading: () => dispatch(HomeActionCreator.onLoadingAction()),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 0, bottom: 20),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: adapter!.itemCount,
      itemBuilder: adapter.itemBuilder!,
    ),
  );
}
