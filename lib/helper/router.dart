import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

class ARouter {
  static Future<Map<dynamic, dynamic>> open(String url,
      {Map<String, dynamic>? params,
      bool withContainer = true,
      bool opaque = false}) {
    return BoostNavigator.instance.push(url,
        arguments: params, withContainer: withContainer, opaque: opaque);
  }

  static Future<bool> close(BuildContext context,
      {Map<String, dynamic>? result}) {
    return BoostNavigator.instance.pop(result);
  }

  static closeDelay(BuildContext context, Duration dutation) {
    return Future.delayed(dutation, () {
      return BoostNavigator.instance.pop();
    });
  }
}
