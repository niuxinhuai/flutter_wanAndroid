import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter_wanandroid/sections/application/page/page.dart';
import 'package:flutter_wanandroid/sections/home/page/home/page.dart';

class RouterHelper {
  static Route<dynamic>? getRouterFactory(
      RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? factory = _routerMap[settings.name!];
    if (factory == null) return null;
    return factory(settings, uniqueId);
  }

  static Map<String, FlutterBoostRouteFactory> _routerMap = {
    "/": (setting, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: setting, pageBuilder: (_, __, ___) => Container());
    },
//    RouterKeys.login: _buildPage(() => Container()),
    RouterKeys.applicaiton: _buildPage(() => ApplicationPage()),
    RouterKeys.home: _buildPage(() => HomePage())
  };

  static FlutterBoostRouteFactory _buildPage(FishRedux.Page Function() page) {
    return (RouteSettings settings, String? uniqueId) {
      var argument = settings.arguments != null
          ? Map<String, dynamic>.from(
              settings.arguments as Map<dynamic, dynamic>)
          : {};
      return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => page().buildPage(argument),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(animation),
              child: child,
            );
          });
    };
  }
}

class RouterKeys {
  static const login = "login";
  static const article = "article";

  //入口类
  static const applicaiton = "application";

  //首页
  static const home = "home";
}
