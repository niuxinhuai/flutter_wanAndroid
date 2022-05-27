import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/widget/webview.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CustomWebViewState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('这是webview'),
    ),
    body: WebViewWidget(
      url: state.url,
    ),
  );
}
