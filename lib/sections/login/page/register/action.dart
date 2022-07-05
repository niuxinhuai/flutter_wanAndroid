import 'package:fish_redux/fish_redux.dart';

enum RegisterAction {
  action,
  onTapRegister,
  onTapClear,
  onTapShowOrHideText,
  didRefresh
}

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onTapClearAction() {
    return const Action(RegisterAction.onTapClear);
  }

  static Action onTapRegisterAction() {
    return const Action(RegisterAction.onTapRegister);
  }

  static Action onTapShowOrHideTextAction() {
    return const Action(RegisterAction.onTapShowOrHideText);
  }

  static Action didRefreshAction() {
    return const Action(RegisterAction.didRefresh);
  }
}
