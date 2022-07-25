import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  TimeUtil._();

  static const String _format1 = 'yyyy.MM.dd';
  static const String _format2 = 'yyMMdd';
  static const String _format3 = "yyyy-MM-dd";
  static const String _format4 = "HH:mm";
  static const String _format5 = "yyyyMMdd";
  static const String _format6 = "yyyyMMdd HH:mm";
  static const String _format7 = "MM-dd";

  static int getApartSeconds() {
    DateTime now = DateTime.now();
    return now.millisecondsSinceEpoch ~/ 1000;
  }

  static String getFormat7(DateTime dateTime) {
    return DateFormat(_format7).format(dateTime);
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

  static bool isSameMonthButBeforDay(DateTime date) {
    DateTime now = DateTime.now();
    return isSameMonth(date) && date.isBefore(now);
  }

  static bool isSameMonthButAfterDay(DateTime date) {
    DateTime now = DateTime.now();
    return isSameMonth(date) && date.isAfter(now);
  }

  static bool isSameMonth(DateTime date) {
    DateTime now = DateTime.now();
    return (now.year == date.year && now.month == date.month);
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
