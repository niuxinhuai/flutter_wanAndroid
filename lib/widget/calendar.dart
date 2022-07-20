import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';
import 'package:flutter_wanandroid/utils/calendar_lunar_util.dart';
import 'package:flutter_wanandroid/utils/calendar_util.dart';
import 'package:flutter_wanandroid/utils/time_util.dart';
import 'package:flutter_wanandroid/widget/card.dart';

class GpCalendar extends StatefulWidget {
  final DateTime? dateTime;
  final double? width;
  final DateTime? now;
  final CalendarWrap? calendarWrap;

  GpCalendar({this.dateTime, this.width, this.now, this.calendarWrap});

  @override
  _GpCalendarState createState() => _GpCalendarState();
}

class _GpCalendarState extends State<GpCalendar> {
  int row = 7;
  int column = 6;
  List<List<Widget>> list = [];
  DateTime? nowTime;
  @override
  void initState() {
    super.initState();
    nowTime = widget.dateTime;
    if (widget.dateTime == null) {
      nowTime = DateTime.now();
    }
//    Future.delayed(Duration.zero, () {
//      //在这里处理页面
//      _reset();
//    });
  }

  void _reset() {
    list.clear();
    int weekday = CalendarUtil.getWeekday(widget.dateTime!);
    int days = CalendarUtil.getDays(widget.dateTime!);
    double width = widget.width!;
    double itemWidth = width / row.toDouble();

    int index = 0;
    if (weekday == row) weekday = 0;
    for (int i = 0; i < column; ++i) {
      List<Widget> rowWidgets = [];
      for (int j = 0; j < row; ++j) {
        if (i == 0 && j == weekday) {
          index += 1;
        } else if (index != 0) {
          index += 1;
        }
        if (index > days) {
          index = -100;
        }
        bool isToday =
            (nowTime!.month == widget.now!.month && widget.now!.day == index);
        bool canShow = (index >= 1 && index <= days);
        String lunarStr = "";
        int holidayState = 0;
        if (canShow) {
          DateTime lunarTime = DateTime(nowTime!.year, nowTime!.month, index);
          String format7 = TimeUtil.getFormat7(lunarTime);
          LunarCalendar lunarCalendar = LunarCalendar(lunarTime);
//          String time =
//              '${lunarCalendar.getChinaMonthString()}月${LunarCalendar.getChinaDayString(lunarCalendar.day)}';
          lunarStr = LunarCalendar.getChinaDayString(lunarCalendar.day);
//          print(">>>>>>>>>>>>>>>>>>:$format7  >>>lunarTime:$lunarTime");
          if (widget.calendarWrap?.holiday != null &&
              widget.calendarWrap!.holiday!.length != 0) {
            if (widget.calendarWrap!.holiday!.containsKey(format7)) {
              ///存在节假日的时间
              CalendarItem? calendarItem =
                  widget.calendarWrap!.holiday![format7];
              if (calendarItem != null) {
                if (calendarItem.holiday != null) {
                  if (calendarItem.holiday == true) {
                    ///节假日
                    lunarStr = calendarItem.name ?? lunarStr;
                    holidayState = 1;
                  } else {
                    ///调休
                    lunarStr = "补班";
                    holidayState = 2;
                  }
                }
              }
            }
          }
        }
        Color detailColor = CommonColors.textColor999;
        if (holidayState == 1) {
          detailColor = CommonColors.primary;
        } else if (holidayState == 2) {
          detailColor = Colors.red;
        }
        Widget rowChildWidget = Container(
          width: itemWidth,
          height: itemWidth,
          decoration: isToday
              ? BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.all(Radius.circular(itemWidth / 2.0)))
              : null,
          alignment: Alignment.center,
          child: canShow
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$index",
                      style: GpOtherTheme.size17(context)?.copyWith(
                          color: isToday
                              ? CommonColors.onPrimaryTextColor
                              : CommonColors.onSurfaceTextColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      lunarStr,
                      style: GpOtherTheme.size12(context)
                          ?.copyWith(fontSize: 10, color: detailColor),
                    )
                  ],
                )
              : null,
        );
        rowWidgets.add(rowChildWidget);
      }
      list.add(rowWidgets);
    }
//    if (mounted) {
//      setState(() {});
//    }
  }

  @override
  Widget build(BuildContext context) {
    _reset();
    if (list.isEmpty) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: CommonColors.foregroundColor,
          width: double.infinity,
          padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
          alignment: Alignment.centerRight,
          child: Text(
            '${widget.dateTime!.month}月',
            style: GpOtherTheme.size20Green(context),
          ),
        ),
        GpCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list
                .map((e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: e.map((e) => e).toList(),
                    ))
                .toList(),
          ),
          width: double.infinity,
//          height: 300,
        )
      ],
    );
  }
}
