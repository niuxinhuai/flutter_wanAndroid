import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/utils/redux/both_mixin.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class KnowledgeArticlePage
    extends Page<KnowledgeArticleState, Map<String, dynamic>>
    with ZMTickerProviderAndWidgetsBindingMixin<KnowledgeArticleState> {
  KnowledgeArticlePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<KnowledgeArticleState>(
              adapter: null,
              slots: <String, Dependent<KnowledgeArticleState>>{}),
          middleware: <Middleware<KnowledgeArticleState>>[],
        );
}
