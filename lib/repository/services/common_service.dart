import 'package:flutter_wanandroid/constants/uri.dart';
import 'package:flutter_wanandroid/helper/service_helper.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';

class CommonService {
  ///首页banner
  static Future<HomeBannerWrap?> getHomeBanner() =>
      ServiceHelper.get(Uri.home_banner)
          .then((json) => HomeBannerWrap.fromJson(json));

  ///首页文章
  static Future<HomeArticleWrap?> getHomeArticle({int page = 0}) =>
      ServiceHelper.get(Uri.home_article(page))
          .then((json) => HomeArticleWrap.fromJson(json));

  ///置顶文章
  static Future<List<HomeArticleBean>?> getTopArticle() =>
      ServiceHelper.get(Uri.top_article).then((json) {
        if (json != null) {
          List? datas = json['data'];
          if (datas != null && datas.length != 0) {
            List<HomeArticleBean> beans = [];
            for (Map<String, dynamic> js in datas) {
              beans.add(HomeArticleBean.fromJson(js));
            }
            return beans;
          }
        }
        return null;
      });
}
