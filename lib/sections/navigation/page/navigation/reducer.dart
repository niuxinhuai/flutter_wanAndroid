import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/left_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavigationArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<NavigationArticleState>>{
      NavigationArticleAction.action: _onAction,
      NavigationArticleAction.didFeatchData: _didFeatchData,
      NavigationArticleAction.didRefreshPage: _didRefreshPage,
    },
  );
}

NavigationArticleState _didFeatchData(
    NavigationArticleState state, Action action) {
  final NavigationArticleWrap articleWrap = action.payload;
  final NavigationArticleState newState = state.clone();
  newState.navigationArticleWrap = articleWrap;
  if (articleWrap.data != null) {
    articleWrap.data![newState.leftState!.curIndex].selected = true;
    newState.leftState!.stages = articleWrap.data!;
    newState.rightState!.items =
        articleWrap.data![newState.leftState!.curIndex].articles!;
  }

  return newState;
}

NavigationArticleState _didRefreshPage(
    NavigationArticleState state, Action action) {
  final NavigationArticleState newState = state.clone();
  NavigationArticleWrap articleWrap = newState.navigationArticleWrap!;
  int index = newState.leftState!.curIndex;
  newState.leftState = NavigationLeftState();
  newState.leftState!.curIndex = index;
  articleWrap.data!.forEach((element) {
    element.selected = false;
  });
  articleWrap.data![newState.leftState!.curIndex].selected = true;
  newState.leftState!.stages = articleWrap.data!;
  newState.rightState!.items =
      articleWrap.data![newState.leftState!.curIndex].articles!;
  return newState;
}

NavigationArticleState _onAction(NavigationArticleState state, Action action) {
  final NavigationArticleState newState = state.clone();
  return newState;
}
