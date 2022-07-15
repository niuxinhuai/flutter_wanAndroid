import 'package:flutter/material.dart';

class TimeUtil {
  TimeUtil._();

  static int getApartSeconds() {
    DateTime now = DateTime.now();
    return now.millisecondsSinceEpoch ~/ 1000;
  }

  static bool isNowHour(String hour) {
    int hourTime = int.tryParse(hour) ?? 0;
    return DateTime.now().hour == hourTime;
  }

  static bool isToday(int? mill) {
    if (mill == null) return false;
    return isTodayByDateTime(DateTime.fromMillisecondsSinceEpoch(mill));
  }

  static bool isSameDay(int mill1, int mill2) {
    return DateUtils.isSameDay(DateTime.fromMillisecondsSinceEpoch(mill1),
        DateTime.fromMillisecondsSinceEpoch(mill2));
  }

  static bool isTodayByDateTime(DateTime date) {
    return DateUtils.isSameDay(DateTime.now(), date);
  }

  static bool isYesterday(DateTime time) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    return yesterday.year == time.year &&
        yesterday.month == time.month &&
        yesterday.day == time.day;
  }

  static DateTime formatExpiresTime(String str) {
    var expiresTime =
        RegExp("Expires[^;]*;").stringMatch(str)!.split(" ")[1].split("-");
    var year = expiresTime[2];
    var day = expiresTime[0];
    var mounth = _getMounthByStr(expiresTime[1]);
    return DateTime(int.parse(year), mounth, int.parse(day));
  }

  static DateTime getDaysAgo(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }

  static int _getMounthByStr(String str) {
    int output = 1;
    switch (str) {
      case "Jan":
        output = 1;
        break;
      case "Feb":
        output = 2;
        break;
      case "Mar":
        output = 3;
        break;
      case "Apr":
        output = 4;
        break;
      case "May":
        output = 5;
        break;
      case "Jun":
        output = 6;
        break;
      case "Jul":
        output = 7;
        break;
      case "Aug":
        output = 8;
        break;
      case "Sep":
        output = 9;
        break;
      case "Oct":
        output = 10;
        break;
      case "Nov":
        output = 11;
        break;
      case "Dec":
        output = 12;
        break;
    }
    return output;
  }
}
