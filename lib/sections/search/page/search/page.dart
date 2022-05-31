import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/search/page/search/history_component/component.dart';
import 'package:flutter_wanandroid/sections/search/page/search/hot_component/component.dart';
import 'package:flutter_wanandroid/utils/redux/both_mixin.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchArticlePage extends Page<SearchArticleState, Map<String, dynamic>>
    with ZMTickerProviderAndWidgetsBindingMixin<SearchArticleState> {
  SearchArticlePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchArticleState>(
              adapter: null,
              slots: <String, Dependent<SearchArticleState>>{
                "hot": SearchHotConnector() + SearchHotComponent(),
                "history": SearchHistoryConnector() + SearchHistoryComponent()
              }),
          middleware: <Middleware<SearchArticleState>>[],
        );
}
