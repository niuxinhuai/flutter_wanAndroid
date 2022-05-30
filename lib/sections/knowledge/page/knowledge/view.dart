import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    KnowledgeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("知识体系"),
    ),
    backgroundColor: CommonColors.foregroundColor,
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    KnowledgeState state, Dispatch dispatch, ViewService viewService) {
  if (state.wrap == null)
    return Container(
      width: 0,
      height: 0,
    );
  ListAdapter? adapter = viewService.buildAdapter();
  //    padding: EdgeInsets.only(top: 0, bottom: 20),
  //    physics: AlwaysScrollableScrollPhysics(),
  //    itemCount: adapter!.itemCount,
  //    itemBuilder: adapter.itemBuilder!,
  return ListView.separated(
      itemBuilder: adapter!.itemBuilder!,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 15),
          color: CommonColors.divider,
          height: 1,
          width: double.infinity,
        );
      },
      itemCount: adapter.itemCount);
}
