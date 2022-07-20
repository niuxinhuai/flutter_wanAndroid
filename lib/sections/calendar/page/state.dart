import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';
import 'package:flutter_wanandroid/utils/calendar_util.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

class CalendarState implements Cloneable<CalendarState> {
  List<DateTime>? datetimes;
  List<String>? bottomList;
  List<GlobalObjectKey>? keys;
  DateTime? nowTime;
  ScrollController? scrollController;
  GlobalKey scrollKey = GlobalKey();
  CalendarWrap? calendarWrap;
  LoadingState? loadingState;

  @override
  CalendarState clone() {
    return CalendarState()
      ..datetimes = datetimes
      ..bottomList = bottomList
      ..keys = keys
      ..nowTime = nowTime
      ..scrollController = scrollController
      ..scrollKey = scrollKey
      ..calendarWrap = calendarWrap
      ..loadingState = loadingState;
  }
}

CalendarState initState(Map<String, dynamic>? args) {
  DateTime now = DateTime.now();
  List<DateTime> list =
      CalendarUtil.getMonth().map((m) => DateTime(now.year, m)).toList();
  List<GlobalObjectKey> keyList =
      CalendarUtil.getMonth().map((e) => GlobalObjectKey("$e")).toList();

  return CalendarState()
    ..datetimes = list
    ..bottomList = ["今天", "日历", "收件箱"]
    ..keys = keyList
    ..nowTime = DateTime.now()
    ..scrollController = ScrollController()
    ..loadingState = LoadingState.isLoading;
}
