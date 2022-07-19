import 'package:flutter/material.dart';

class CalendarUtil {
  ///日期
  static List<String> headerList = ["日", "一", "二", "三", "四", "五", "六"];

  static List<int> getMonth() => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  ///获取某月的第一天是星期几
  static int getWeekday(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month).weekday;

  ///获取某个月有多少天
  static int getDays(DateTime dateTime) =>
      DateUtils.getDaysInMonth(dateTime.year, dateTime.month);
}
