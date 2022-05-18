import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeCellComponent extends Component<HomeArticleBean> {
  HomeCellComponent()
      : super(
//            effect: buildEffect(),
//            reducer: buildReducer(),
          view: buildView,
        );
}
