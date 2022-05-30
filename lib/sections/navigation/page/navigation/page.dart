import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/left_component/component.dart';
import 'package:flutter_wanandroid/sections/navigation/page/navigation/right_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NavigationArticlePage
    extends Page<NavigationArticleState, Map<String, dynamic>> {
  NavigationArticlePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<NavigationArticleState>(
              adapter: null,
              slots: <String, Dependent<NavigationArticleState>>{
                //leftComponent/rightComponent为对应组件的唯一标识符
                //Connector为连接器，可以理解为数据传递器
                //Component为对应的组件
                "leftComponent":
                    NavigationLeftConnector() + NavigationLeftComponent(),
                "rightComponent":
                    NavigationRightConnector() + NavigationRightComponent()
              }),
          middleware: <Middleware<NavigationArticleState>>[],
        );
}
