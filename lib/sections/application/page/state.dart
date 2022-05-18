import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;

class ApplicationState implements Cloneable<ApplicationState> {
  int? page;
  P.PageController? pageController;

  @override
  ApplicationState clone() {
    return ApplicationState()
      ..page = page
      ..pageController = pageController;
  }
}

ApplicationState initState(Map<String, dynamic>? args) {
  return ApplicationState();
}
