import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/db/db_model.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchHistoryState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '搜索历史',
                style: GpOtherTheme.size19(viewService.context)!
                    .copyWith(color: CommonColors.primary),
              ),
              GestureDetector(
                onTap: () =>
                    dispatch(SearchHistoryActionCreator.onCleanAction()),
                child: Text(
                  '全部清除',
                  style: GpOtherTheme.size13(viewService.context)!
                      .copyWith(color: CommonColors.textColor999),
                ),
              )
            ],
          ),
        ),
        _buildWrapWidget(state, dispatch, viewService)
      ],
    ),
  );
}

Widget _buildWrapWidget(
    SearchHistoryState state, Dispatch dispatch, ViewService viewService) {
  if (state.logs.isEmpty) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Text(
        "快去搜索更多干货资源吧～",
        style: GpOtherTheme.size14(viewService.context)
            .copyWith(color: CommonColors.textColor999),
      ),
    );
  }

  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children:
        state.logs.map((e) => _buildItem(e, dispatch, viewService)).toList(),
  );
}

Widget _buildItem(
    UserSearchLog item, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(SearchHistoryActionCreator.onTapItemAction(item)),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 9),
//      decoration: BoxDecoration(
//          color: CommonColors.disableColor,
//          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Text(
        item.keyWords ?? "",
        style: GpOtherTheme.size13(viewService.context)!
            .copyWith(color: CommonColors.textColor999),
      ),
    ),
  );
}
