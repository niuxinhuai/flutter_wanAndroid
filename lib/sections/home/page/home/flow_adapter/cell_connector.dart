import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/page/home/state.dart';

class CellConnector extends ConnOp<HomeState, HomeArticleBean> {
  final int index;
  CellConnector({this.index = 0});

  @override
  HomeArticleBean? get(HomeState? state) {
    if (index > state!.beans!.length) return null;
    return state.beans![index];
  }
}
