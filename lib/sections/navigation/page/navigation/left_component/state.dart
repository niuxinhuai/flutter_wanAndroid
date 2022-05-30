import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';

class NavigationLeftState implements Cloneable<NavigationLeftState> {
  List<NavigationStage> stages = [];
  int curIndex = 0;

  @override
  NavigationLeftState clone() {
    return NavigationLeftState()
      ..stages = stages
      ..curIndex = curIndex;
  }
}

NavigationLeftState initState(Map<String, dynamic> args) {
  return NavigationLeftState();
}
