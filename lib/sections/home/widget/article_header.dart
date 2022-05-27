import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/utils/string_util.dart';

class ArticleHeaderWidget extends StatelessWidget {
  final HomeArticleBean? bean;
  ArticleHeaderWidget({this.bean});

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
    bool isNewArticle = (bean!.fresh != null && bean!.fresh!);
    bool hasTags = bean!.tags != null && bean!.tags!.length != 0;
    return Row(
      children: [
        if (isNewArticle)
          Text(
            '新',
            style: GpOtherTheme.size13(context)!
                .copyWith(color: CommonColors.kaoyanPayTwoColor),
          ),
        Padding(
          padding: EdgeInsets.only(left: isNewArticle ? 3 : 0, right: 3),
          child: Text(
              !StringUtils.isNullOrEmpty(bean!.author)
                  ? bean!.author!
                  : bean!.shareUser ?? '',
              style: GpOtherTheme.size13(context)),
        ),
        if (hasTags)
          Row(
            children: bean!.tags!
                .map((tagBean) => Padding(
                      padding: EdgeInsets.only(
                          left: bean!.tags!.indexOf(tagBean) != 0 ? 3 : 0),
                      child: _buildTag(tagBean, context),
                    ))
                .toList(),
          ),
      ],
    );
  }

  Widget _buildTag(ArticleTagBean tagBean, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1, bottom: 1, left: 2, right: 3),
      decoration: BoxDecoration(
        border: new Border.all(color: CommonColors.kaoyanPayTwoColor),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Text(
        tagBean.name ?? "",
        style: GpOtherTheme.size11Grey(context)
            .copyWith(color: CommonColors.kaoyanPayTwoColor),
      ),
    );
  }

  Widget _buildRight(BuildContext context) {
    return Text(
      bean!.niceDate ?? "",
      style: GpOtherTheme.size13(context)!
          .copyWith(color: CommonColors.textColor999),
    );
  }
}
