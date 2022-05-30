import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NavigationArticleState state, Dispatch dispatch, ViewService viewService) {
  if (state.navigationArticleWrap == null) {
    return Container(
      width: 0,
      height: 0,
    );
  }
  return Scaffold(
    appBar: AppBar(
      title: Text('导航'),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () =>
              dispatch(NavigationArticleActionCreator.onTapSearchAction()),
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
    ),
    backgroundColor: CommonColors.backgroundColor,
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    NavigationArticleState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _getLeft(viewService),
      _getRight(viewService),
    ],
  );
}

//左视图
Expanded _getLeft(ViewService viewService) {
  return Expanded(
    flex: 2,
    child: Container(
      decoration: BoxDecoration(color: Colors.cyan),
      child: viewService.buildComponent('leftComponent'),
    ),
  );
}

//右视图
Expanded _getRight(ViewService viewService) {
  return Expanded(
    flex: 4,
    child: Container(
      height: double.infinity,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      child: viewService.buildComponent('rightComponent'),
    ),
  );
}
