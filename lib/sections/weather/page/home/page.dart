import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WeatherSegmentPage extends Page<WeatherSegmentState, Map<String, dynamic>> {
  WeatherSegmentPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WeatherSegmentState>(
                adapter: null,
                slots: <String, Dependent<WeatherSegmentState>>{
                }),
            middleware: <Middleware<WeatherSegmentState>>[
            ],);

}
