import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeCellAction { action }

class HomeCellActionCreator {
  static Action onAction() {
    return const Action(HomeCellAction.action);
  }
}
