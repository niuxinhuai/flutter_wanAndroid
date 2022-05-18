import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeHeaderComponent extends Component<HomeBannerWrap> {
  HomeHeaderComponent()
      : super(
//            effect: buildEffect(),
//            reducer: buildReducer(),
          view: buildView,
        );
}
