import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

class NavigationRightState implements Cloneable<NavigationRightState> {
  List<HomeArticleBean> items = [];

  @override
  NavigationRightState clone() {
    return NavigationRightState()..items = items;
  }
}

NavigationRightState initState(Map<String, dynamic> args) {
  return NavigationRightState();
}
