import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

class AMapHomeState implements Cloneable<AMapHomeState> {
  CameraPosition? cameraPosition;
  AMapController? aMapController;
  AMapFlutterLocation? aMapFlutterLocation;

  @override
  AMapHomeState clone() {
    return AMapHomeState()
      ..cameraPosition = cameraPosition
      ..aMapController = aMapController
      ..aMapFlutterLocation = aMapFlutterLocation;
  }
}

AMapHomeState initState(Map<String, dynamic>? args) {
  return AMapHomeState()..aMapFlutterLocation = AMapFlutterLocation();
}
