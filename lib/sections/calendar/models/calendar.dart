import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar.g.dart';

@JsonSerializable()
class CalendarWrap {
  CalendarWrap();

  int? code;
  Map<String, CalendarItem>? holiday;

  factory CalendarWrap.fromJson(Map<String, dynamic> json) =>
      _$CalendarWrapFromJson(json);

  toJson() => _$CalendarWrapToJson(this);
}

@JsonSerializable()
class CalendarItem {
  CalendarItem();

  bool? holiday;
  // 节假日的中文名。
  String? name;
  // true表示放完假后调休，false表示先调休再放假
  bool? after;
  // 薪资倍数，3表示是3倍工资
  int? wage;
  // 表示调休的节假日
  String? target;
  // 节假日的日期
  String? date;
  // 表示当前时间距离目标还有多少天。比如今天是 2018-09-28，距离 2018-10-01 还有3天
  int? rest;

  factory CalendarItem.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemFromJson(json);

  toJson() => _$CalendarItemToJson(this);
}
