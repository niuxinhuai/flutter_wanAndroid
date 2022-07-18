import 'package:flutter/material.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:flutter_wanandroid/constants/key.dart';

class AMapUtil {
  static AMapApiKey amapApiKeys = AMapApiKey(
      androidKey: '900f72eeee0f21e435cebb0ef155582a',
      iosKey: ConstantsKey.aMapiOSKey);

  static const AMapPrivacyStatement amapPrivacyStatement =
      AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);
}
