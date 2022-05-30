import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/left_component/state.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/right_component/state.dart';

class NavigationArticleState implements Cloneable<NavigationArticleState> {
  NavigationArticleWrap? navigationArticleWrap;
  NavigationLeftState? leftState;
  NavigationRightState? rightState;

  @override
  NavigationArticleState clone() {
    return NavigationArticleState()
      ..navigationArticleWrap = navigationArticleWrap
      ..leftState = leftState
      ..rightState = rightState;
  }
}

NavigationArticleState initState(Map<String, dynamic>? args) {
  return NavigationArticleState()
    ..leftState = NavigationLeftState()
    ..rightState = NavigationRightState();
}

///左边组件连接器
class NavigationLeftConnector
    extends ConnOp<NavigationArticleState, NavigationLeftState> {
  @override
  NavigationLeftState? get(NavigationArticleState? state) {
    return state?.leftState;
  }

  @override
  void set(NavigationArticleState state, NavigationLeftState subState) {
    state.leftState = subState;
    state.rightState?.items =
        state.leftState!.stages[state.leftState!.curIndex].articles!;
    print(">>>>>>>>>>>>>>>>index:${state.leftState?.curIndex}");
  }
}

///右侧组建连接器
class NavigationRightConnector
    extends ConnOp<NavigationArticleState, NavigationRightState> {
  @override
  NavigationRightState? get(NavigationArticleState? state) {
    return state?.rightState;
  }

  @override
  void set(NavigationArticleState state, NavigationRightState subState) {
    state.rightState = subState;
  }
}
