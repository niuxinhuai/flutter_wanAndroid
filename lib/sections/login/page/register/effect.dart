import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/repository/share_preferences/sp.dart';
import 'package:flutter_wanandroid/sections/login/models/login.dart';
import 'package:flutter_wanandroid/utils/time_util.dart';
import 'package:flutter_wanandroid/widget/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<RegisterState>? buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.onTapClear: _onTapClear,
    RegisterAction.onTapShowOrHideText: _onTapShowOrHideText,
    RegisterAction.onTapRegister: _onTapRegister,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _onAction(Action action, Context<RegisterState> ctx) {}

void _initState(Action action, Context<RegisterState> ctx) {
  ctx.state.nameEditingController?.addListener(() {
    _resetButtonState(action, ctx);
  });

  ctx.state.passwordEditingController?.addListener(() {
    _resetButtonState(action, ctx);
  });

  ctx.state.rePasswordEditingController?.addListener(() {
    _resetButtonState(action, ctx);
  });
}

void _resetButtonState(Action action, Context<RegisterState> ctx) {
  String? name = ctx.state.nameEditingController?.text;
  String? password = ctx.state.passwordEditingController?.text;
  String? rePassword = ctx.state.rePasswordEditingController?.text;
  if (name?.isNotEmpty == true &&
      password?.isNotEmpty == true &&
      rePassword?.isNotEmpty == true) {
    if (ctx.state.buttonEnable == false) {
      ctx.state.buttonEnable = true;
      ctx.dispatch(RegisterActionCreator.didRefreshAction());
    }
  } else {
    if (ctx.state.buttonEnable == true) {
      ctx.state.buttonEnable = false;
      ctx.dispatch(RegisterActionCreator.didRefreshAction());
    }
  }
}

void _onTapClear(Action action, Context<RegisterState> ctx) {
  ctx.state.nameEditingController?.clear();
  ctx.dispatch(RegisterActionCreator.didRefreshAction());
}

void _onTapShowOrHideText(Action action, Context<RegisterState> ctx) {
  ctx.state.hideText = !ctx.state.hideText;
  ctx.dispatch(RegisterActionCreator.didRefreshAction());
}

void _onTapRegister(Action action, Context<RegisterState> ctx) async {
  if (ctx.state.buttonEnable) {
    String? name = ctx.state.nameEditingController?.text;
    String? password = ctx.state.passwordEditingController?.text;
    String? rePassword = ctx.state.rePasswordEditingController?.text;
    if (name?.isNotEmpty == true &&
        password?.isNotEmpty == true &&
        rePassword?.isNotEmpty == true) {
      if (name!.length < 6 || password!.length < 6 || rePassword!.length < 6) {
        Toast.toast(ctx.context, "密码不符合标准");
      } else {
        if (password != rePassword) {
          Toast.toast(ctx.context, "两次输入的密码有误,请重试");
          return;
        }
        Response response =
            await CommonService.register(name, password, rePassword);
        LoginWrap model = LoginWrap.fromJson(response.data);
        if (model.errorCode == -1) {
          Toast.toast(ctx.context, model.errorMsg ?? "注册出错，请重试");
          return;
        }
        if (model.errorCode == 0) {
          Toast.toast(ctx.context, "注册成功，请登录");
          ARouter.close(ctx.context);
        }
      }
    }
  }
}

void _dispose(Action action, Context<RegisterState> ctx) {
  ctx.state.nameEditingController?.dispose();
  ctx.state.passwordEditingController?.dispose();
  ctx.state.rePasswordEditingController?.dispose();
}
