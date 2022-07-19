import 'package:fish_redux/fish_redux.dart';

enum CalendarAction { action, onTapBottom }

class CalendarActionCreator {
  static Action onAction() {
    return const Action(CalendarAction.action);
  }

  static Action onTapBottomAction(int index) {
    return Action(CalendarAction.onTapBottom, payload: index);
  }
}
