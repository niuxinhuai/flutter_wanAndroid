import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeArticleBean state, Dispatch dispatch, ViewService viewService) {
  print(">>>>>>>>>>>>>cell:${state.toJson()}");
  return Container();
}
