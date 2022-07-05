import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class LoginState implements Cloneable<LoginState> {
  bool isLogin = true;
  bool hideText = true;
  TextEditingController? nameEditingController;
  TextEditingController? passwordEditingController;
  bool buttonEnable = false;

  @override
  LoginState clone() {
    return LoginState()
      ..isLogin = isLogin
      ..nameEditingController = nameEditingController
      ..passwordEditingController = passwordEditingController
      ..hideText = hideText
      ..buttonEnable = buttonEnable;
  }
}

LoginState initState(Map<String, dynamic>? args) {
  return LoginState()
    ..nameEditingController = TextEditingController()
    ..passwordEditingController = TextEditingController();
}
