import 'package:fish_redux/fish_redux.dart';

class HomeHeaderState implements Cloneable<HomeHeaderState> {

  @override
  HomeHeaderState clone() {
    return HomeHeaderState();
  }
}

HomeHeaderState initState(Map<String, dynamic> args) {
  return HomeHeaderState();
}
