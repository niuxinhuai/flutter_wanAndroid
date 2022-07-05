import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/widget/appbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      title: Text(state.isLogin ? "登录页" : "注册页"),
    ),
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  var border = UnderlineInputBorder();
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: state.nameEditingController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
                labelText: '请输入账号',
                border: border,
                suffix: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () =>
                      dispatch(LoginActionCreator.onTapClearTextAction()),
                ),
                contentPadding: EdgeInsets.all(8))),
        TextField(
          controller: state.passwordEditingController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              labelText: '请输入密码',
              border: border,
              suffix: IconButton(
                icon: Icon(state.hideText
                    ? Icons.panorama_fish_eye
                    : Icons.remove_red_eye), //remove_red_eye
                onPressed: () =>
                    dispatch(LoginActionCreator.onTapShowOrHideTextAction()),
              ),
              contentPadding: EdgeInsets.all(8)),
          obscureText: state.hideText,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => dispatch(LoginActionCreator.onTapGoRegisterAction()),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "还没有账号？快点我注册吧～",
              style: GpOtherTheme.size13(viewService.context)!
                  .copyWith(color: CommonColors.textColor666),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => dispatch(LoginActionCreator.onTaoLoginAction()),
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: EdgeInsets.only(top: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: state.buttonEnable
                    ? CommonColors.homeStatisticsStrokeLineColor
                    : CommonColors.videoActionTitleText,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            alignment: Alignment.center,
            child: Text(
              '登录',
              style: GpOtherTheme.size17(viewService.context)!
                  .copyWith(color: CommonColors.onPrimaryTextColor),
            ),
          ),
        ),
      ],
    ),
  );
}
