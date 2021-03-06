import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';

class ApplicationModule {
  static const List<String> tabTitles = ['首页', '体系', '公众号', '导航', '项目'];
  static const List<IconData> tabIcons = [
    Icons.home,
    Icons.message,
    Icons.account_balance_wallet,
    Icons.navigation,
    Icons.settings
  ];

  static List<BottomNavigationBarItem> bottomTabs = tabTitles
      .map((e) => BottomNavigationBarItem(
          icon: Icon(tabIcons[tabTitles.indexOf(e)]),
          label: e,
          backgroundColor: CommonColors.primary))
      .toList();
}
