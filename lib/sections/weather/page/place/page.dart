import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WeatherPlacePage extends Page<WeatherPlaceState, Map<String, dynamic>> {
  WeatherPlacePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WeatherPlaceState>(
                adapter: null,
                slots: <String, Dependent<WeatherPlaceState>>{
                }),
            middleware: <Middleware<WeatherPlaceState>>[
            ],);

}
