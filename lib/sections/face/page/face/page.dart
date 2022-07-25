import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FaceAuthPage extends Page<FaceAuthState, Map<String, dynamic>> {
  FaceAuthPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FaceAuthState>(
                adapter: null,
                slots: <String, Dependent<FaceAuthState>>{
                }),
            middleware: <Middleware<FaceAuthState>>[
            ],);

}
