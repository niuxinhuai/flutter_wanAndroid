import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/page/knowledge/flow_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class KnowledgePage extends Page<KnowledgeState, Map<String, dynamic>> {
  KnowledgePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<KnowledgeState>(
              adapter: NoneConn<KnowledgeState>() + adapter,
              slots: <String, Dependent<KnowledgeState>>{}),
          middleware: <Middleware<KnowledgeState>>[],
        );
}
