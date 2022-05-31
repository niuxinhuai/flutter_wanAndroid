import 'package:flutter_wanandroid/constants/uri.dart';
import 'package:flutter_wanandroid/helper/service_helper.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';

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

  ///知识体系
  static Future<KnowledgeArticleWrap> getKnowledge() =>
      ServiceHelper.get(Uri.knowledge)
          .then((json) => KnowledgeArticleWrap.fromJson(json));

  ///知识体系下的文章
  static Future<List<HomeArticleBean>> getKnowledgeUserArticle(
          int page, int cid) =>
      ServiceHelper.get(Uri.knowledge_article(page, cid)).then((json) {
        List<HomeArticleBean> items = [];
        List<dynamic> list = json['data']['datas'];
        for (dynamic map in list) {
          items.add(HomeArticleBean.fromJson(map));
        }
        return items;
      });

  ///微信公众号
  static Future<List<KnowledgeChildItem>> getWxArticle() =>
      ServiceHelper.get(Uri.wxArticle).then((json) {
        List<KnowledgeChildItem> items = [];
        List<dynamic> list = json['data'];
        for (dynamic map in list) {
          items.add(KnowledgeChildItem.fromJson(map));
        }
        return items;
      });

  ///微信公众号下的文章
  static Future<List<HomeArticleBean>> getWxUserArticle(int page, int id) =>
      ServiceHelper.get(Uri.wxUserArticleList(id, page)).then((json) {
        List<HomeArticleBean> items = [];
        List<dynamic> list = json['data']['datas'];
        for (dynamic map in list) {
          items.add(HomeArticleBean.fromJson(map));
        }
        return items;
      });

  ///导航
  static Future<NavigationArticleWrap> getNavigationData() =>
      ServiceHelper.get(Uri.navigationJson)
          .then((json) => NavigationArticleWrap.fromJson(json));

  ///项目
  static Future<List<KnowledgeChildItem>> getProgectArticle() =>
      ServiceHelper.get(Uri.projectTree).then((json) {
        List<KnowledgeChildItem> items = [];
        List<dynamic> list = json['data'];
        for (dynamic map in list) {
          items.add(KnowledgeChildItem.fromJson(map));
        }
        return items;
      });

  ///微信公众号下的文章
  static Future<List<HomeArticleBean>> getProjectUserArticle(
          int page, int id) =>
      ServiceHelper.get(Uri.projectList(page, id)).then((json) {
        List<HomeArticleBean> items = [];
        List<dynamic> list = json['data']['datas'];
        for (dynamic map in list) {
          items.add(HomeArticleBean.fromJson(map));
        }
        return items;
      });
}
