import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/widget/refresh_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("首页"),
    ),
    body: _buildBody(state, dispatch, viewService),
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
