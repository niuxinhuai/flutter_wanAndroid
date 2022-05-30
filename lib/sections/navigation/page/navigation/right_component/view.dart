import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NavigationRightState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: CommonColors.foregroundColor,
    child: SingleChildScrollView(
      padding: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 15,
        children: state.items
            .map((e) => _buildItem(e, viewService.context, dispatch))
            .toList(),
      ),
    ),
  );
}

Widget _buildItem(
    HomeArticleBean bean, BuildContext context, Dispatch dispatch) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(NavigationRightActionCreator.onTapItemAction(bean)),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 9),
      decoration: BoxDecoration(
          color: CommonColors.disableColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Text(
        bean.title ?? "",
        style: GpOtherTheme.size13(context),
      ),
    ),
  );
}
