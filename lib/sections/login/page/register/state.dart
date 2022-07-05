import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class RegisterState implements Cloneable<RegisterState> {
  TextEditingController? nameEditingController;
  TextEditingController? passwordEditingController;
  TextEditingController? rePasswordEditingController;
  bool hideText = true;
  bool buttonEnable = false;

  @override
  RegisterState clone() {
    return RegisterState()
      ..nameEditingController = nameEditingController
      ..passwordEditingController = passwordEditingController
      ..rePasswordEditingController = rePasswordEditingController
      ..hideText = hideText
      ..buttonEnable = buttonEnable;
  }
}

RegisterState initState(Map<String, dynamic>? args) {
  return RegisterState()
    ..nameEditingController = TextEditingController()
    ..passwordEditingController = TextEditingController()
    ..rePasswordEditingController = TextEditingController();
}
