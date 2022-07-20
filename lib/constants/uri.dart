import 'package:flutter_wanandroid/constants/key.dart';

class Uri {
  ///base
  static const String baseUri = "https://www.wanandroid.com/";

  ///彩云base
  static const String caiyun_base_uri = "https://api.caiyunapp.com/";

  ///首页banner
  static const String home_banner = "banner/json";

  ///首页文章列表
  static String home_article(int page) => "article/list/$page/json";

  ///置顶文章
  static const String top_article = "article/top/json";

  ///知识体系
  ///方法：GET
  static const String knowledge = "tree/json";

  ///知识体系下的文章
  ///方法：GET
  static String knowledge_article(int page, int cid) =>
      "article/list/$page/json?cid=$cid";

  ///微信公众号文章
  ///方法：GET
  static const String wxArticle = "wxarticle/chapters/json";

  ///微信公众号下对应的用户id的文章
  ///方法：GET
  static String wxUserArticleList(int id, int page) =>
      "wxarticle/list/$id/$page/json";

  ///导航
  ///方法：GET
  static const String navigationJson = "navi/json";

  ///项目
  ///方法： GET
  static const String projectTree = "project/tree/json";

  ///项目列表下的数据,
  ///方法：GET
  ///参数：
  ///	cid 分类的id，上面项目分类接口
  ///	页码：拼接在链接中，从1开始。
  static String projectList(int page, int cid) =>
      "project/list/$page/json?cid=$cid";

  ///搜索
  ///方法：POST
  ///页码：拼接在链接上，从0开始。
  ///k ： 搜索关键词
  static String searchJson(int page) => "article/query/$page/json";

  ///热搜
  static const String hotSearch = "hotkey/json";

  ///登录
  ///方法：POST
  ///参数：
  ///	username，password
  static const String login = "user/login";

  ///注册
  ///方法：POST
  ///参数
  ///	username,password,repassword
  static const String register = "user/register";

  ///退出登录
  ///方法：GET
  static const String logout = "user/logout/json";

  ///收藏站内文章
  ///方法：POST
  static String collectIn(int id) => "lg/collect/$id/json";

  ///收藏站外文章
  ///方法：POST
  ///title，author，link
  static const String collectOut = "lg/collect/add/json";

  ///收藏文章列表
  ///方法：GET
  static String collectList(int page, int page_size) =>
      "lg/collect/list/$page/json?page_size=$page_size";

  ///取消收藏
  static String unCollect(int id) => "lg/uncollect_originId/$id/json";
}

class WeatherUri extends Uri {
  ///获取位置信息
  static String weatherPlace(String query) =>
      "v2/place?query=$query&token=${ConstantsKey.weatherToken}&lang=zh_CN";

  ///获取准时天气信息
  static String weatherRealTime(double lat, double lng) =>
      "v2.6/${ConstantsKey.weatherToken}/$lng,$lat/realtime";

  ///获取未来7天的天气数据
  static String weatherDaily(double lat, double lng) =>
      "v2.6/${ConstantsKey.weatherToken}/$lng,$lat/daily?dailysteps=7";

  ///获取未来24小时天气
  static String weatherHourly(double lat, double lng) =>
      "v2.6/${ConstantsKey.weatherToken}/$lng,$lat/hourly?hourlysteps=24";

  ///获取天气综合数据
  static String getWeather(double lat, double lng) =>
      "v2.6/${ConstantsKey.weatherToken}/$lng,$lat/weather?alert=true&dailysteps=7&hourlysteps=24";
}

class CalendarUri extends Uri {
  ///获取对应年份的节假日
  static String getCalendarHolidays(int year) =>
      "http://timor.tech/api/holiday/year/$year/";
}
