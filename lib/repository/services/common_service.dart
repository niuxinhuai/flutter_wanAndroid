import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_wanandroid/constants/uri.dart';
import 'package:flutter_wanandroid/helper/service_helper.dart';
import 'package:flutter_wanandroid/models/simple_model.dart';
import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/login/models/login.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';

class CommonService {
  ///首页banner
  static Future<HomeBannerWrap?> getHomeBanner() =>
      ServiceHelper.get(Uri.home_banner)
          .then((json) => HomeBannerWrap.fromJson(json));

  static Future<dynamic> getVideoSource() =>
      ServiceHelper.get("video/auth/4").then((value) => jsonDecode(value));

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

  ///热搜
  static Future<SearchWrap> getHotSearch() => ServiceHelper.get(Uri.hotSearch)
      .then((json) => SearchWrap.fromJson(json));

  ///搜索
  ///支持多个关键词，用空格隔开
  static Future<List<HomeArticleBean>> getSearch(int page, String keyWords) =>
      ServiceHelper.post(Uri.searchJson(page), data: {'k': keyWords})
          .then((json) {
        List<HomeArticleBean> items = [];
        List<dynamic> list = json['data']['datas'];
        for (dynamic map in list) {
          items.add(HomeArticleBean.fromJson(map));
        }
        return items;
      });

  ///登录
  static Future<Response> login(String username, String password) async {
    FormData formData = new FormData.fromMap({
      "username": "$username",
      "password": "$password",
    });
    return await Dio().post(Uri.baseUri + Uri.login, data: formData);
  }

  ///注册
  static Future<Response> register(
      String username, String password, String repassword) async {
    FormData formData = new FormData.fromMap({
      "username": "$username",
      "password": "$password",
      "repassword": "$password",
    });
    return await Dio().post(Uri.baseUri + Uri.register, data: formData);
  }

  ///退出登录
  static Future<LoginWrap?> logout() async {
    return await ServiceHelper.get(Uri.logout)
        .then((value) => LoginWrap.fromJson(value));
  }

  ///收藏站内文章
  static Future<SimpleModel> collectInArticle(int id) async {
    return ServiceHelper.post(Uri.collectIn(id))
        .then((value) => SimpleModel.fromJson(value));
  }

  ///收藏站外的文章
  static Future<SimpleModel> collectOutArticle(
      String title, String author, String link) async {
    return ServiceHelper.post(Uri.collectOut,
            data: {"title": title, "author": author, "link": link})
        .then((value) => SimpleModel.fromJson(value));
  }

  ///取消收藏
  static Future<SimpleModel> unCollectArticle(int id) async {
    return ServiceHelper.post(Uri.unCollect(id))
        .then((value) => SimpleModel.fromJson(value));
  }

  ///收藏列表
  static Future<HomeArticleWrap> collectList(int page, int page_size) async {
    return ServiceHelper.get(Uri.collectList(page, page_size))
        .then((value) => HomeArticleWrap.fromJson(value));
  }

  ///天气综合数据
  static Future<WeatherStage> getWeather(double lat, double lng) {
    return Dio()
        .get(Uri.caiyun_base_uri + WeatherUri.getWeather(lat, lng))
        .then((value) => WeatherStage.fromJson(value.data));
  }

  ///实时天气
  static Future<WeatherStage> getWeatherRealTime(double lat, double lng) {
    return Dio()
        .get(Uri.caiyun_base_uri + WeatherUri.weatherRealTime(lat, lng))
        .then((value) => WeatherStage.fromJson(value.data));
  }

  ///未来几天的天气
  static Future<WeatherStage> getWeatherDaily(double lat, double lng) {
    return Dio()
        .get(Uri.caiyun_base_uri + WeatherUri.weatherDaily(lat, lng))
        .then((value) => WeatherStage.fromJson(value.data));
  }

  ///未来24小时的天气
  static Future<WeatherStage> getWeatherHourly(double lat, double lng) {
    return Dio()
        .get(Uri.caiyun_base_uri + WeatherUri.weatherHourly(lat, lng))
        .then((value) => WeatherStage.fromJson(value.data));
  }

  ///获取地方信息
  static Future<PlaceStage> getWeatherPlace(String query) {
    return Dio()
        .get(Uri.caiyun_base_uri + WeatherUri.weatherPlace(query))
        .then((value) => PlaceStage.fromJson(value.data));
  }

  ///获取日历节假日信息
  static Future<CalendarWrap> getCalendarHoliday(int year) {
    return Dio()
        .get(CalendarUri.getCalendarHolidays(year),
            options:
                buildCacheOptions(Duration(days: 3), subKey: "calendar_$year"))
        .then((value) => CalendarWrap.fromJson(value.data));
  }
}
