import 'package:fish_redux/fish_redux.dart';
import 'package:local_auth/local_auth.dart';

class FaceAuthState implements Cloneable<FaceAuthState> {
  LocalAuthentication? localAuthentication;

  @override
  FaceAuthState clone() {
    return FaceAuthState()..localAuthentication = localAuthentication;
  }
}

FaceAuthState initState(Map<String, dynamic>? args) {
  return FaceAuthState()..localAuthentication = LocalAuthentication();
}
