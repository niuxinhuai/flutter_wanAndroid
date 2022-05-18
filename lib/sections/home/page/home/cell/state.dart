import 'package:fish_redux/fish_redux.dart';

class HomeCellState implements Cloneable<HomeCellState> {

  @override
  HomeCellState clone() {
    return HomeCellState();
  }
}

HomeCellState initState(Map<String, dynamic> args) {
  return HomeCellState();
}
