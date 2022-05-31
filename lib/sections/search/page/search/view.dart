import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchArticleState state, Dispatch dispatch, ViewService viewService) {
  if (state.searchWrap == null) {
    return Container(
      width: 0,
      height: 0,
    );
  }
  return Scaffold(
    appBar: AppBar(
      titleSpacing: 0,
      title: _buildTextField(state, dispatch, viewService),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () =>
              dispatch(SearchArticleActionCreator.onTapClearWordsAction()),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Text(
              '清理',
              style: GpOtherTheme.size12(viewService.context),
            ),
          ),
        ),
      ],
    ),
    body: _buildBody(state, dispatch, viewService),
    backgroundColor: CommonColors.foregroundColor,
  );
}

///输入框
Widget _buildTextField(
    SearchArticleState state, Dispatch dispatch, ViewService viewService) {
  String regStr =
      "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
  return Container(
    constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
    decoration: BoxDecoration(
        color: Theme.of(viewService.context).colorScheme.surface,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
            width: 1, color: Theme.of(viewService.context).dividerColor)),
    child: TextField(
      enabled: true,
      autofocus: false,
      enableInteractiveSelection: false,
      //禁用menu
      maxLines: 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
          hintText: '发现更多精彩',
          hintStyle: GpOtherTheme.size13Grey(viewService.context)),
      keyboardType: TextInputType.multiline,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(regStr))],
      textInputAction: TextInputAction.search,
      onSubmitted: (String str) =>
          dispatch(SearchArticleActionCreator.onSubmitAction(str)),
      style: Theme.of(viewService.context)
          .textTheme
          .subtitle2!
          .copyWith(color: CommonColors.primary),
      controller: state.textEditingController,
      textCapitalization: TextCapitalization.sentences,
    ),
  );
}

Widget _buildBody(
    SearchArticleState state, Dispatch dispatch, ViewService viewService) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        viewService.buildComponent('hot'),
        viewService.buildComponent('history')
      ],
    ),
  );
}
