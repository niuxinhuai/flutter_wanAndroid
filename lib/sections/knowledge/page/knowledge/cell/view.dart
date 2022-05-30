import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge/action.dart';

Widget buildView(
    KnowledgeStage state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(KnowledgeActionCreator.onTapCellAction(state)),
    child: Container(
      padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildItem(state, dispatch, viewService),
          ),
          Container(
            width: 44,
            child: Icon(
              Icons.chevron_right,
              color: CommonColors.onSurfaceTextColor,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildItem(
    KnowledgeStage state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        state.name ?? "",
        style: GpOtherTheme.size16(viewService.context)
            .copyWith(fontWeight: FontWeight.bold),
      ),
      if (state.children != null && state.children!.length != 0)
        _buildGridWidget(state, dispatch, viewService, state.children!)
    ],
  );
}

Widget _buildGridWidget(KnowledgeStage state, Dispatch dispatch,
    ViewService viewService, List<KnowledgeChildItem> items) {
  return Padding(
    padding: EdgeInsets.only(top: 15),
    child: Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items
          .map((item) => _buildGridItem(state, dispatch, viewService, item))
          .toList(),
    ),
  );
}

Widget _buildGridItem(KnowledgeStage state, Dispatch dispatch,
    ViewService viewService, KnowledgeChildItem item) {
  return Container(
    padding: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
    decoration: BoxDecoration(
        border: Border.all(color: CommonColors.essayPieKaoyan),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Text(
      item.name ?? "",
      style: GpOtherTheme.size12(viewService.context),
    ),
  );
}
