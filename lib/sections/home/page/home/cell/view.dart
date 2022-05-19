import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/page/home/action.dart';
import 'package:flutter_wanandroid/utils/string_util.dart';
import 'package:flutter_wanandroid/widget/card.dart';

Widget buildView(
    HomeArticleBean state, Dispatch dispatch, ViewService viewService) {
  if (state.envelopePic != null && state.envelopePic!.isNotEmpty) {
    print(">>>>>>>>url:${state.envelopePic}");
  }
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(HomeActionCreator.onTapCellAction(state)),
    child: GpCard(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
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
                      text: !StringUtils.isNullOrEmpty(state.author)
                          ? state.author
                          : state.shareUser ?? '',
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
            StringUtils.stripHtmlIfNeeded(state.title ?? ""),
            maxLines: 2,
            style: GpOtherTheme.size16(viewService.context),
          ),
          if (state.desc != null)
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                StringUtils.stripHtmlIfNeeded(state.desc!).trim(),
                maxLines: 3,
                style: GpOtherTheme.size14(viewService.context),
              ),
            ),
          if (state.envelopePic != null && state.envelopePic!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: state.envelopePic!,
              width: 200,
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
                      text: (state.superChapterName != null
                              ? state.superChapterName! + ' · '
                              : '') +
                          (state.chapterName ?? ''),
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
