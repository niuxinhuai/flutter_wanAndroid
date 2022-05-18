import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<HomeState> ctx) {
  CommonService.getHomeBanner().then((value) {
    print(">>>>>>>>value:${value.toJson()}");
  });

  CommonService.getHomeArticle(page: 0).then((value) {
    print(">>>>>>>article:${value.toJson()}");
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}
