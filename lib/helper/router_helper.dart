import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_wanandroid/sections/application/page/page.dart';
import 'package:flutter_wanandroid/sections/home/page/home/page.dart';
import 'package:flutter_wanandroid/sections/home/page/webview/page.dart';

class RouterHelper {
  static Map<String, FishRedux.Page> routers = {
    RouterKeys.applicaiton: ApplicationPage(),
    RouterKeys.home: HomePage(),
    RouterKeys.webView: CustomWebViewPage(),
  };
}

class RouterKeys {
  static const login = "login";
  static const article = "article";

  //入口类
  static const applicaiton = "application";

  //首页
  static const home = "home";

  //webview
  static const webView = "webView";
}
