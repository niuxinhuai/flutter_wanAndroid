import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AMapHomePage extends Page<AMapHomeState, Map<String, dynamic>> {
  AMapHomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AMapHomeState>(
                adapter: null,
                slots: <String, Dependent<AMapHomeState>>{
                }),
            middleware: <Middleware<AMapHomeState>>[
            ],);

}
