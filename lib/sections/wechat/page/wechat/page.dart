import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WeChatArticlePage extends Page<WeChatArticleState, Map<String, dynamic>> {
  WeChatArticlePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WeChatArticleState>(
                adapter: null,
                slots: <String, Dependent<WeChatArticleState>>{
                }),
            middleware: <Middleware<WeChatArticleState>>[
            ],);

}
