import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as P;
import 'action.dart';
import 'state.dart';
import 'dart:ui';

Effect<CalendarState>? buildEffect() {
  return combineEffects(<Object, Effect<CalendarState>>{
    CalendarAction.action: _onAction,
    CalendarAction.onTapBottom: _onTapBottom,
  });
}

void _onAction(Action action, Context<CalendarState> ctx) {}

void _onTapBottom(Action action, Context<CalendarState> ctx) {
  final int index = action.payload;
  print(">>>>>>>>>>index:$index");
  if (index == 0) {
    ///跳转到当前月份所在位置
    int idx = ctx.state.nowTime!.month - 1;
    if (idx < ctx.state.keys!.length) {
      P.GlobalObjectKey objectKey = ctx.state.keys![idx];

      P.RenderBox renderBox =
          objectKey.currentContext!.findRenderObject() as P.RenderBox;
      double dy = renderBox
          .localToGlobal(P.Offset.zero,
              ancestor: ctx.state.scrollKey.currentContext!.findRenderObject())
          .dy;
      var offset = dy + ctx.state.scrollController!.offset;
      double stateTop = P.MediaQueryData.fromWindow(window).padding.top;
      ctx.state.scrollController!.animateTo(offset - stateTop,
          duration: Duration(milliseconds: 500), curve: P.Curves.linear);
    }
  }
}
