import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';

class ARouter {
  static Future<dynamic> open(BuildContext context, String url,
      {Map<String, dynamic>? params}) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return RouterHelper.routers[url]!.buildPage(params);
    })).then((value) => value);
  }

  static close(BuildContext context, {Map<String, dynamic>? result}) {
    return Navigator.pop(context, result);
  }

  static closeDelay(BuildContext context, Duration dutation) {
    return Future.delayed(dutation, () {
      return Navigator.pop(context);
    });
  }
}
