import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_wanandroid/sections/home/page/home/page.dart';
import 'package:flutter_wanandroid/sections/knowledge/page/knowledge/page.dart';
import 'package:flutter_wanandroid/widget/segment.dart';

class ApplicationState implements Cloneable<ApplicationState> {
  int? page;
  P.PageController? pageController;
  List<P.Widget> children = [];

  @override
  ApplicationState clone() {
    return ApplicationState()
      ..page = page
      ..pageController = pageController
      ..children = children;
  }
}

ApplicationState initState(Map<String, dynamic>? args) {
  List<P.Widget> children = [];
  children.add(KeepAliveWidget(
    childWidget: HomePage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: KnowledgePage().buildPage({}),
  ));
  children.add(KeepAliveWidget(
    childWidget: P.Container(
      alignment: P.Alignment.center,
      child: P.Text('公众号'),
    ),
  ));
  children.add(KeepAliveWidget(
    childWidget: P.Container(
      alignment: P.Alignment.center,
      child: P.Text('我的'),
    ),
  ));

  return ApplicationState()..children = children;
}
