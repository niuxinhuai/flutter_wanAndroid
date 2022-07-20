import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/calendar/models/calendar.dart';

enum CalendarAction { action, onTapBottom, didFetch }

class CalendarActionCreator {
  static Action onAction() {
    return const Action(CalendarAction.action);
  }

  static Action onTapBottomAction(int index) {
    return Action(CalendarAction.onTapBottom, payload: index);
  }

  static Action didFetchAction(CalendarWrap wrap) {
    return Action(CalendarAction.didFetch, payload: wrap);
  }
}
