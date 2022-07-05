import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_wanandroid/sections/application/page/page.dart';
import 'package:flutter_wanandroid/sections/favorite/page/page.dart';
import 'package:flutter_wanandroid/sections/home/page/home/page.dart';
import 'package:flutter_wanandroid/sections/home/page/webview/page.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge_article/page.dart';
import 'package:flutter_wanandroid/sections/login/page/login/page.dart';
import 'package:flutter_wanandroid/sections/login/page/register/page.dart';
import 'package:flutter_wanandroid/sections/search/page/result/page.dart';
import 'package:flutter_wanandroid/sections/search/page/search/page.dart';

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
    RouterKeys.applicaiton: ApplicationPage(),
    RouterKeys.home: HomePage(),
    RouterKeys.knowledge_article: KnowledgeArticlePage(),
    RouterKeys.webView: CustomWebViewPage(),
    RouterKeys.search: SearchArticlePage(),
    RouterKeys.search_result: SearchResultPage(),
    RouterKeys.login: LoginPage(),
    RouterKeys.register: RegisterPage(),
    RouterKeys.collect: FavoriteArticlePage(),
  };
}

class RouterKeys {
  static const login = "login";
  static const register = "register";
  static const article = "article";

  //入口类
  static const applicaiton = "application";

  //首页
  static const home = "home";

  //知识体系
  static const knowledge = "knowledge";

  //知识体系下文章页
  static const knowledge_article = "knowledge_article";

  //webview
  static const webView = "webView";

  //搜索
  static const search = "search";

  //搜索结果
  static const search_result = "search_result";

  //收藏
  static const collect = "collect";
}
