import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/models/navigation.dart';

enum NavigationLeftAction { onTapItem, didRefreshPage }

class NavigationLeftActionCreator {
  static Action onTapItemAction(NavigationStage stage, int index) {
    return Action(NavigationLeftAction.onTapItem,
        payload: Tuple2(stage, index));
  }

  static Action didRefreshPageAction() {
    return Action(NavigationLeftAction.didRefreshPage);
  }
}
