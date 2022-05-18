import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class ApplicationState implements Cloneable<ApplicationState> {
  int? page;
  PageController? pageController;

  @override
  ApplicationState clone() {
    return ApplicationState()..page = page;
  }
}

ApplicationState initState(Map<String, dynamic>? args) {
  return ApplicationState();
}
