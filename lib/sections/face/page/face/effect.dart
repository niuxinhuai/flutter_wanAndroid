import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:local_auth/local_auth.dart';
import 'action.dart';
import 'state.dart';

Effect<FaceAuthState>? buildEffect() {
  return combineEffects(<Object, Effect<FaceAuthState>>{
    FaceAuthAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<FaceAuthState> ctx) async {
//  bool canCheckBiometrics = await LocalA;

//  LocalAuthentication;
  bool can = await ctx.state.localAuthentication!.canCheckBiometrics;
  print(">>>>>>>>>>>can:$can");
  List<BiometricType> availableBiometrics =
      await ctx.state.localAuthentication!.getAvailableBiometrics();
  print(
      ">>>>>>>>>>>>>>>platform:${Platform.isIOS}  >>>>>:${Platform.localeName} l:${availableBiometrics.length}");
  if (Platform.isIOS) {
    if (availableBiometrics.contains(BiometricType.face)) {
      // Face ID.
      print(">>>>>>>>>>>>face Id");
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      // Touch ID.a
      print(">>>>>>>>>>>>>Touch ID");
    }
  }

  ctx.state.localAuthentication!.authenticate(localizedReason: "请进行身份验证");
}

void _onAction(Action action, Context<FaceAuthState> ctx) {}
