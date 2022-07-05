import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FavoriteArticlePage extends Page<FavoriteArticleState, Map<String, dynamic>> {
  FavoriteArticlePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FavoriteArticleState>(
                adapter: null,
                slots: <String, Dependent<FavoriteArticleState>>{
                }),
            middleware: <Middleware<FavoriteArticleState>>[
            ],);

}
