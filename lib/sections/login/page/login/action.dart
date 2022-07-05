import 'package:fish_redux/fish_redux.dart';

enum LoginAction {
  action,
  onTapGoRegister,
  onTaoLogin,
  onTapClearText,
  onTapShowOrHideText,
  didRefresh
}

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onTapGoRegisterAction() {
    return const Action(LoginAction.onTapGoRegister);
  }

  static Action onTaoLoginAction() {
    return const Action(LoginAction.onTaoLogin);
  }

  static Action onTapClearTextAction() {
    return const Action(LoginAction.onTapClearText);
  }

  static Action onTapShowOrHideTextAction() {
    return const Action(LoginAction.onTapShowOrHideText);
  }

  static Action didRefreshAction() {
    return const Action(LoginAction.didRefresh);
  }
}
