import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CustomWebViewAction { action }

class CustomWebViewActionCreator {
  static Action onAction() {
    return const Action(CustomWebViewAction.action);
  }
}
