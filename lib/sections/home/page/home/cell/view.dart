import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/page/home/action.dart';

Widget buildView(
    HomeArticleBean state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(HomeActionCreator.onTapCellAction(state)),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '新',
                    style: GpOtherTheme.size13(viewService.context)!
                        .copyWith(color: CommonColors.kaoyanPayTwoColor),
                  ),
                  TextSpan(
                      text: state.shareUser,
                      style: GpOtherTheme.size13(viewService.context))
                ])),
                Text(
                  state.niceDate ?? "",
                  style: GpOtherTheme.size13(viewService.context),
                )
              ],
            ),
          ),
          Text(
            state.title ?? "",
            maxLines: 1,
            style: GpOtherTheme.size16(viewService.context),
          ),
          if (state.desc != null)
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                state.desc!,
                maxLines: 3,
                style: GpOtherTheme.size14(viewService.context),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '新',
                    style: GpOtherTheme.size13(viewService.context)!
                        .copyWith(color: CommonColors.kaoyanPayTwoColor),
                  ),
                  TextSpan(
                      text: "${state.superChapterName}~${state.chapterName}",
                      style: GpOtherTheme.size13(viewService.context))
                ])),
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.cyan,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
