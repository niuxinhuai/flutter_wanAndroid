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
  final Function(int)? callBack;
  final bool? isFromCollect;

  ArticleItemWidget(
      {this.articleBean, this.callBack, this.isFromCollect = false});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (articleBean?.envelopePic != null &&
                  articleBean!.envelopePic!.isNotEmpty)
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      imageUrl: articleBean!.envelopePic!,
                      fit: BoxFit.fill,
                      width: 120,
                      height: 200,
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringUtils.stripHtmlIfNeeded(articleBean!.title ?? ""),
                      maxLines: 2,
                      style: GpOtherTheme.size16(context),
                    ),
                    if (articleBean?.desc != null)
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          StringUtils.stripHtmlIfNeeded(articleBean!.desc!)
                              .trim(),
                          maxLines: 3,
                          style: GpOtherTheme.size14(context),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: ArticleBottomWidget(
              bean: articleBean,
              isFromCollect: isFromCollect,
              iconData: Icons.favorite_border,
              callBack: (int id) {
                if (callBack != null) {
                  callBack!(id);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
