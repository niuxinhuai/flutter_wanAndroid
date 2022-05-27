import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/widget/article_bottom.dart';
import 'package:flutter_wanandroid/sections/home/widget/article_header.dart';
import 'package:flutter_wanandroid/utils/string_util.dart';
import 'package:flutter_wanandroid/widget/card.dart';

class ArticleItemWidget extends StatelessWidget {
  final HomeArticleBean? articleBean;

  ArticleItemWidget({this.articleBean});

  @override
  Widget build(BuildContext context) {
    return GpCard(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ArticleHeaderWidget(
                bean: articleBean,
              )),
          Text(
            StringUtils.stripHtmlIfNeeded(articleBean!.title ?? ""),
            maxLines: 2,
            style: GpOtherTheme.size16(context),
          ),
          if (articleBean?.desc != null)
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                StringUtils.stripHtmlIfNeeded(articleBean!.desc!).trim(),
                maxLines: 3,
                style: GpOtherTheme.size14(context),
              ),
            ),
          if (articleBean?.envelopePic != null &&
              articleBean!.envelopePic!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: articleBean!.envelopePic!,
              width: 200,
            ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: ArticleBottomWidget(
              bean: articleBean,
              iconData: Icons.favorite_border,
              callBack: () {},
            ),
          )
        ],
      ),
    );
  }
}
