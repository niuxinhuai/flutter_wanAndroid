import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';

class ApplicationModule {
  static const List<String> tabTitles = ['首页', '问答', '体系', '我的'];
  static const List<IconData> tabIcons = [
    Icons.home,
    Icons.message,
    Icons.account_balance_wallet,
    Icons.settings
  ];

  static List<BottomNavigationBarItem> bottomTabs = tabTitles
      .map((e) => BottomNavigationBarItem(
          icon: Icon(tabIcons[tabTitles.indexOf(e)]),
          label: e,
          backgroundColor: CommonColors.primary))
      .toList();
}
