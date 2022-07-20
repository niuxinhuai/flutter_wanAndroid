import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/utils/calendar_lunar_util.dart';
import 'package:flutter_wanandroid/utils/calendar_util.dart';
import 'package:flutter_wanandroid/widget/card.dart';

class GpCalendar extends StatefulWidget {
  final DateTime? dateTime;
  final double? width;
  final DateTime? now;

  GpCalendar({this.dateTime, this.width, this.now});

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
    nowTime = widget.now;
    if (widget.now == null) {
      nowTime = DateTime.now();
    }
    Future.delayed(Duration.zero, () {
      //在这里处理页面
      _reset();
    });
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
            (nowTime!.month == widget.dateTime!.month && nowTime!.day == index);
        bool canShow = (index >= 1 && index <= days);
        String lunarStr = "";
        if (canShow) {
          DateTime lunarTime = DateTime(nowTime!.year, nowTime!.month, index);
          LunarCalendar lunarCalendar = LunarCalendar(lunarTime);
//          String time =
//              '${lunarCalendar.getChinaMonthString()}月${LunarCalendar.getChinaDayString(lunarCalendar.day)}';
          lunarStr = LunarCalendar.getChinaDayString(lunarCalendar.day);
//          print(">>>>>>>>>>>>>>>>>>:$time ");
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
                      style:
                          GpOtherTheme.size12(context)?.copyWith(fontSize: 10),
                    )
                  ],
                )
              : null,
        );
        rowWidgets.add(rowChildWidget);
      }
      list.add(rowWidgets);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
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
