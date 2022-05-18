import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_wanandroid/helper/flutter_helper.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/res/theme.dart';
import 'package:flutter_wanandroid/res/theme_provider.dart';
import 'package:flutter_wanandroid/sections/application/page/page.dart';

void main() {
  FlutterBindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      home: Builder(builder: (BuildContext context) {
        return ApplicationPage().buildPage({});
      }),
    );
//    return FlutterBoostApp(RouterHelper.getRouterFactory,
//        appBuilder: (home) => MaterialApp(
//              theme: getAppTheme(),
//              home: Builder(builder: (BuildContext context) {
//                return ApplicationPage().buildPage({});
//              }),
//            ));
  }
}
