import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeHeaderAction { action }

class HomeHeaderActionCreator {
  static Action onAction() {
    return const Action(HomeHeaderAction.action);
  }
}
