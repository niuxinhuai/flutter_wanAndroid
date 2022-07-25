import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/constants/key.dart';
import 'package:flutter_wanandroid/sections/amap/models/amap.dart';
import 'action.dart';
import 'state.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';

Effect<AMapHomeState>? buildEffect() {
  return combineEffects(<Object, Effect<AMapHomeState>>{
    AMapHomeAction.action: _onAction,
    Lifecycle.initState: _initState,
    AMapHomeAction.onLocationChanged: _onLocationChanged,
    AMapHomeAction.onMapCreate: _onMapCreate,
    Lifecycle.dispose: _dispose,
  });
}

void _onAction(Action action, Context<AMapHomeState> ctx) {}

void _initState(Action action, Context<AMapHomeState> ctx) {
  AMapFlutterLocation.setApiKey(
      "900f72eeee0f21e435cebb0ef155582a", ConstantsKey.aMapiOSKey);
  AMapFlutterLocation.updatePrivacyAgree(true);
  AMapFlutterLocation.updatePrivacyShow(true, true);
  ctx.state.aMapFlutterLocation!.startLocation();
  ctx.state.aMapFlutterLocation!.onLocationChanged().listen((event) {
    MapLocationEvent locationEvent = MapLocationEvent.fromJson(event);
    print(">>>>>>>evemt:${locationEvent.longitude} ${locationEvent.latitude}");
    if (ctx.state.cameraPosition != null) {
      ctx.state.aMapFlutterLocation?.destroy();
    } else {
      ctx.state.cameraPosition = CameraPosition(
          target: LatLng(double.parse(locationEvent.latitude!),
              double.parse(locationEvent.longitude!)),
          zoom: 17);
      ctx.dispatch(AMapHomeActionCreator.didReloadction());
    }
  });
}

void _onMapCreate(Action action, Context<AMapHomeState> ctx) {
  ctx.state.aMapController = action.payload;
}

void _onLocationChanged(Action action, Context<AMapHomeState> ctx) {
  final AMapLocation aMapLocation = action.payload;
  if (aMapLocation.latLng.latitude !=
          ctx.state.cameraPosition!.target.latitude &&
      aMapLocation.latLng.longitude !=
          ctx.state.cameraPosition!.target.longitude) {
    ctx.state.cameraPosition = CameraPosition(
        target:
            LatLng(aMapLocation.latLng.latitude, aMapLocation.latLng.longitude),
        zoom: 17);
    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(
//      CameraPosition(
//        //中心点
//          target: LatLng(31.230378, 121.473658),
//          //缩放级别
//          zoom: 18,
//          //俯仰角0°~45°（垂直与地图时为0）
//          tilt: 30,
//          //偏航角 0~360° (正北方为0)
//          bearing: 0),
      ctx.state.cameraPosition!,
    );
    if (ctx.state.aMapController != null) {
      ctx.state.aMapController!.moveCamera(cameraUpdate);
    }
//    ctx.dispatch(AMapHomeActionCreator.didReloadction());
  }
}

void _dispose(Action action, Context<AMapHomeState> ctx) {
  ctx.state.aMapFlutterLocation?.destroy();
  ctx.state.aMapController?.disponse();
}
