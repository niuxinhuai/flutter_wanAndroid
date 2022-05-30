import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NavigationRightComponent extends Component<NavigationRightState> {
  NavigationRightComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NavigationRightState>(
                adapter: null,
                slots: <String, Dependent<NavigationRightState>>{
                }),);

}
