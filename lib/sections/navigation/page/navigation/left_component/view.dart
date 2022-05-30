import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NavigationLeftState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: CommonColors.foregroundColor,
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(context, state.stages[index], index, dispatch);
      },
      itemCount: state.stages.length,
    ),
  );
}

Widget _buildItem(
    BuildContext context, NavigationStage stage, int index, Dispatch dispatch) {
  Color color = CommonColors.foregroundColor;
  Color textColor = CommonColors.textColor666;
  if (stage.selected) {
    color = CommonColors.primary;
    textColor = CommonColors.onPrimaryTextColor;
  }
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () =>
        dispatch(NavigationLeftActionCreator.onTapItemAction(stage, index)),
    child: Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      color: color,
      alignment: Alignment.center,
      child: Text(
        stage.name ?? "",
        style: GpOtherTheme.size15(context)!.copyWith(color: textColor),
      ),
    ),
  );
}
