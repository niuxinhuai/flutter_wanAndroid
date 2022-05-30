import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NavigationLeftComponent extends Component<NavigationLeftState> {
  NavigationLeftComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NavigationLeftState>(
                adapter: null,
                slots: <String, Dependent<NavigationLeftState>>{
                }),);

}
