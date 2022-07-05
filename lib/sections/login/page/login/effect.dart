import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/flutter_helper.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/helper/user.dart';
import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:flutter_wanandroid/repository/database/common_database.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/repository/share_preferences/sp.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/login/models/login.dart';
import 'package:flutter_wanandroid/utils/time_util.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_wanandroid/widget/toast.dart';

Effect<LoginState>? buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.onTapClearText: _onTapClearText,
    LoginAction.onTapShowOrHideText: _onTapShowOrHideText,
    LoginAction.onTaoLogin: _onTaoLogin,
    LoginAction.onTapGoRegister: _onTapGoRegister,
    Lifecycle.dispose: _dispose,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _initState(Action action, Context<LoginState> ctx) {
  ctx.state.nameEditingController?.addListener(() {
    String? name = ctx.state.nameEditingController?.text;
    String? password = ctx.state.passwordEditingController?.text;
    if (name?.isNotEmpty == true && password?.isNotEmpty == true) {
      if (ctx.state.buttonEnable == false) {
        ctx.state.buttonEnable = true;
        ctx.dispatch(LoginActionCreator.didRefreshAction());
      }
    } else {
      if (ctx.state.buttonEnable == true) {
        ctx.state.buttonEnable = false;
        ctx.dispatch(LoginActionCreator.didRefreshAction());
      }
    }
  });
  ctx.state.passwordEditingController?.addListener(() {
    String? name = ctx.state.nameEditingController?.text;
    String? password = ctx.state.passwordEditingController?.text;
    if (name?.isNotEmpty == true && password?.isNotEmpty == true) {
      if (ctx.state.buttonEnable == false) {
        ctx.state.buttonEnable = true;
        ctx.dispatch(LoginActionCreator.didRefreshAction());
      }
    } else {
      if (ctx.state.buttonEnable == true) {
        ctx.state.buttonEnable = false;
        ctx.dispatch(LoginActionCreator.didRefreshAction());
      }
    }
  });
}

void _onTapClearText(Action action, Context<LoginState> ctx) {
  ctx.state.nameEditingController?.clear();
  ctx.dispatch(LoginActionCreator.didRefreshAction());
}

void _onTapShowOrHideText(Action action, Context<LoginState> ctx) {
  ctx.state.hideText = !ctx.state.hideText;
  ctx.dispatch(LoginActionCreator.didRefreshAction());
}

void _dispose(Action action, Context<LoginState> ctx) {
  ctx.state.nameEditingController?.dispose();
  ctx.state.passwordEditingController?.dispose();
}

void _onTaoLogin(Action action, Context<LoginState> ctx) async {
  if (ctx.state.buttonEnable) {
    String? name = ctx.state.nameEditingController?.text;
    String? password = ctx.state.passwordEditingController?.text;
    if (name?.isNotEmpty == true && password?.isNotEmpty == true) {
      if (name!.length < 6 || password!.length < 6) {
        Toast.toast(ctx.context, "账号不符合标准");
      } else {
        Response response = await CommonService.login(name, password);
        LoginWrap model = LoginWrap.fromJson(response.data);
        if (model.errorCode == 0) {
          SpUtil.setUserName(name);
          SpUtil.setPassword(password);
          String cookie = "";
          DateTime? expires;
          response.headers.forEach((String name, List<String> values) {
            if (name == "set-cookie") {
              cookie = json
                  .encode(values)
                  .replaceAll("\[\"", "")
                  .replaceAll("\"\]", "")
                  .replaceAll("\",\"", "; ");
              try {
                expires = TimeUtil.formatExpiresTime(cookie);
              } catch (e) {
                expires = DateTime.now();
              }
            }
          });
          SpUtil.setCookie(cookie);
          SpUtil.setCookieExpires(expires!.toIso8601String());
          await UserDefault.refresh();

          ///没有获取所有收藏的接口，暂时先将就用这个
          HomeArticleWrap wrap = await CommonService.collectList(0, 40);
          if (wrap.data?.articleList != null &&
              wrap.data?.articleList?.length != 0) {
            await CommonDb.inserCollecttDataFromSync(wrap.data!.articleList!);
          }

          eventBus.fire(LoginWrap());
          Toast.toast(ctx.context, "登录成功");

          ARouter.close(ctx.context);
        } else {
          Toast.toast(ctx.context, model.errorMsg ?? "登录出错，请重试");
          return;
        }
      }
    }
  }
}

void _onTapGoRegister(Action action, Context<LoginState> ctx) {
  ARouter.open(ctx.context, RouterKeys.register);
}
