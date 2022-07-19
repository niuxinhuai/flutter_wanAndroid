import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CalendarPage extends Page<CalendarState, Map<String, dynamic>> {
  CalendarPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CalendarState>(
                adapter: null,
                slots: <String, Dependent<CalendarState>>{
                }),
            middleware: <Middleware<CalendarState>>[
            ],);

}
