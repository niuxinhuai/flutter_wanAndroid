import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/simple_model.dart';
import 'package:flutter_wanandroid/repository/database/common_database.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/login/models/login.dart';
import 'package:flutter_wanandroid/widget/toast.dart';
import 'package:flutter_wanandroid/helper/flutter_helper.dart';

class ArticleBottomWidget extends StatefulWidget {
  final HomeArticleBean? bean;
  final IconData? iconData;
  final Function(int)? callBack;
  final bool? isFromCollect;

  ArticleBottomWidget(
      {this.bean, this.iconData, this.callBack, this.isFromCollect = false});

  @override
  _ArticleBottomWidgetState createState() => _ArticleBottomWidgetState();
}

class _ArticleBottomWidgetState extends State<ArticleBottomWidget> {
  bool hasCollect = false;
  int? id;

  @override
  void initState() {
    super.initState();
    if (widget.isFromCollect! == true) {
      if (widget.bean?.originId != null) {
        id = widget.bean!.originId;
      }
    } else {
      if (widget.bean?.id != null) {
        id = widget.bean!.id;
      }
    }
    _getCollectState();

    eventBus.on<LoginWrap>().listen((event) {
      _getCollectState();
    });
  }

  void _getCollectState() async {
    if (id != null) {
      bool collect = await CommonDb.articleHasCollect(id!);
      if (collect != hasCollect) {
        if (mounted) {
          setState(() {
            hasCollect = collect;
          });
        }
      }
    }
  }

  void _onTapCollect() async {
    if (id != null) {
      SimpleModel model = hasCollect
          ? await CommonService.unCollectArticle(id!)
          : await collectArticle();
      if (model.errorCode == 0) {
        hasCollect = !hasCollect;
        if (hasCollect) {
          await CommonDb.updateCollectArticleId(id!);
        } else {
          await CommonDb.unCollectArticleId(id!);
          if (widget.callBack != null) {
            widget.callBack!(id!);
          }
        }

        ///刷新界面
        if (mounted) {
          setState(() {});
        }
      } else {
        Toast.toast(context,
            model.errorMsg ?? (hasCollect ? "取消收藏失败，请重试" : "收藏失败，请重试"));
      }
    }
  }

  Future<SimpleModel> collectArticle() async {
    if (widget.bean!.link != null &&
        widget.bean!.link!.contains("wanandroid.com")) {
      return await CommonService.collectInArticle(id!);
    }
    String? title = widget.bean!.title;
    String? author = widget.bean!.author;
    String? link = widget.bean!.link;
    if (title != null && author != null && link != null) {
      return await CommonService.collectOutArticle(title, author, link);
    }
    return SimpleModel()
      ..errorCode = -1
      ..errorMsg = "外部文章收藏失败";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bean == null)
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
    bool isTop = (widget.bean!.type != null && widget.bean!.type! == 1);
    return Row(
      children: [
        if (isTop)
          Text("置顶",
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.kaoyanPayTextColor)),
        Padding(
          padding: EdgeInsets.only(left: isTop ? 3 : 0),
          child: Text(
              (widget.bean!.superChapterName != null
                      ? widget.bean!.superChapterName! + ' · '
                      : '') +
                  (widget.bean!.chapterName ?? ''),
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.textColor999)),
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapCollect(),
      child: Icon(
        hasCollect ? Icons.favorite : Icons.favorite_border,
        size: 25,
        color: Colors.red,
      ),
    );
  }
}
