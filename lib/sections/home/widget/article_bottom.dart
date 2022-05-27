import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

class ArticleBottomWidget extends StatelessWidget {
  final HomeArticleBean? bean;
  final IconData? iconData;
  final Function? callBack;

  ArticleBottomWidget({this.bean, this.iconData, this.callBack});

  @override
  Widget build(BuildContext context) {
    if (bean == null)
      return Container(
        alignment: Alignment.center,
        child: Text('bean为空'),
      );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildLeft(context), _buildRight(context)],
    );
  }

  Widget _buildLeft(BuildContext context) {
    bool isTop = (bean!.type != null && bean!.type! == 1);
    return Row(
      children: [
        if (isTop)
          Text("置顶",
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.kaoyanPayTextColor)),
        Padding(
          padding: EdgeInsets.only(left: isTop ? 3 : 0),
          child: Text(
              (bean!.superChapterName != null
                      ? bean!.superChapterName! + ' · '
                      : '') +
                  (bean!.chapterName ?? ''),
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.textColor999)),
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callBack != null) {
          callBack!();
        }
      },
      child: Icon(
        iconData,
        size: 25,
        color: Colors.red,
      ),
    );
  }
}
