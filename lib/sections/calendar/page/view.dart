import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/utils/calendar_lunar_util.dart';
import 'package:flutter_wanandroid/utils/calendar_util.dart';
import 'package:flutter_wanandroid/widget/appbar.dart';
import 'package:flutter_wanandroid/widget/calendar.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CalendarState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    bottomNavigationBar: Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.only(left: 25, right: 25, top: 20),
      color: CommonColors.backgroundColor,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: state.bottomList!
            .map((e) => GestureDetector(
                  onTap: () => dispatch(CalendarActionCreator.onTapBottomAction(
                      state.bottomList!.indexOf(e))),
                  child: Text(
                    e,
                    style: GpOtherTheme.size17(viewService.context)!
                        .copyWith(color: Colors.red),
                  ),
                ))
            .toList(),
      ),
    ),
    appBar: GpAppBar(
      centerTitle: false,
      titleSpacing: 0,
      backgroundColor: CommonColors.backgroundColor,
      title: Text("${DateTime.now().year}年"),
      actions: [Icon(Icons.search), Icon(Icons.add)],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 30,
//          color: Colors.cyan,
//          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: CalendarUtil.headerList
                .map((e) => Container(
                      child: Text(
                        e,
                        style: GpOtherTheme.size15(viewService.context),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return SingleChildScrollView(
            key: state.scrollKey,
            controller: state.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.datetimes!
                  .map((e) => Container(
                        key: state.keys![state.datetimes!.indexOf(e)],
                        child: GpCalendar(
                          calendarWrap: state.calendarWrap,
                          now: state.nowTime,
                          dateTime: e,
                          width: MediaQuery.of(viewService.context).size.width,
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    ),
  );
}
