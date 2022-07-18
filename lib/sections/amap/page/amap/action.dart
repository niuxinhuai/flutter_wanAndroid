import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

enum AMapHomeAction { action, onLocationChanged, onMapCreate, didReload }

class AMapHomeActionCreator {
  static Action onAction() {
    return const Action(AMapHomeAction.action);
  }

  static Action onMapCreateAction(AMapController aMapController) {
    return Action(AMapHomeAction.onMapCreate, payload: aMapController);
  }

  static Action onLocationChangedAction(AMapLocation aMapLocation) {
    return Action(AMapHomeAction.onLocationChanged, payload: aMapLocation);
  }

  static Action didReloadction() {
    return const Action(AMapHomeAction.didReload);
  }
}
