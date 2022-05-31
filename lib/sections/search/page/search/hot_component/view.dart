import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchHotState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            '热搜',
            style: GpOtherTheme.size19(viewService.context)!
                .copyWith(color: CommonColors.primary),
          ),
        ),
        _buildWrapWidget(state, dispatch, viewService)
      ],
    ),
  );
}

Widget _buildWrapWidget(
    SearchHotState state, Dispatch dispatch, ViewService viewService) {
  if (state.searchWrap == null ||
      (state.searchWrap != null && (state.searchWrap!.data?.isEmpty == true))) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Text(
        "暂无热搜哦～",
        style: GpOtherTheme.size14(viewService.context)
            .copyWith(color: CommonColors.textColor666),
      ),
    );
  }
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: state.searchWrap!.data!
        .map((e) => _buildItem(e, dispatch, viewService))
        .toList(),
  );
}

Widget _buildItem(
    HotSearchItem item, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(SearchHotActionCreator.onTapItemAction(item)),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 9),
      decoration: BoxDecoration(
          color: CommonColors.disableColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Text(
        item.name ?? "",
        style: GpOtherTheme.size13(viewService.context),
      ),
    ),
  );
}
