import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/helper/user.dart';
import 'package:flutter_wanandroid/repository/database/common_database.dart';
import 'package:flutter_wanandroid/sections/login/models/login.dart';
import 'package:flutter_wanandroid/widget/toast.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_wanandroid/helper/flutter_helper.dart';

Effect<HomeDrawerState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeDrawerState>>{
    Lifecycle.initState: _initState,
    HomeDrawerAction.action: _onAction,
    HomeDrawerAction.onTapSegment: _onTapSegment,
  });
}

void _onAction(Action action, Context<HomeDrawerState> ctx) {}

void _initState(Action action, Context<HomeDrawerState> ctx) async {
  ctx.state.isLogin = UserDefault.isLogin();
  ctx.state.titles.last = ctx.state.isLogin ? "退出登录" : "登录";
}

void _onTapSegment(Action action, Context<HomeDrawerState> ctx) async {
  String value = action.payload;
  P.Navigator.pop(ctx.context);
  if (value == "我的收藏") {
    if (!ctx.state.isLogin) {
      Toast.toast(ctx.context, "登录后可查看我的收藏");
    } else {
      ///去我的收藏
      ARouter.open(ctx.context, RouterKeys.collect);
    }
  } else if (value == "退出登录") {
    LoginWrap? wrap = await UserDefault.logout();
    if (wrap != null && wrap.errorCode == 0) {
      UserDefault.clear();
      await CommonDb.clearAllDbs();
      eventBus.fire(LoginWrap());
    } else {
      Toast.toast(ctx.context, "退出失败，请重试");
    }
  } else if (value == "登录") {
    ARouter.open(ctx.context, RouterKeys.login);
  } else if (value == "天气") {
    ARouter.open(ctx.context, RouterKeys.weather_segment);
  } else if (value == "地图") {
    ARouter.open(ctx.context, RouterKeys.amap);
  } else if (value == "日历") {
    ARouter.open(ctx.context, RouterKeys.calendar);
  }
}
