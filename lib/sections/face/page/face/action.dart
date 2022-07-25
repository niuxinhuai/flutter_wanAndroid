import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FaceAuthAction { action }

class FaceAuthActionCreator {
  static Action onAction() {
    return const Action(FaceAuthAction.action);
  }
}
