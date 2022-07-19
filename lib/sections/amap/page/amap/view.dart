import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/utils/amap_util.dart' as P;

import 'action.dart';
import 'state.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

Widget buildView(
    AMapHomeState state, Dispatch dispatch, ViewService viewService) {
  if (state.cameraPosition == null) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Text("定位中请稍等"),
    );
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 3,
        child: Container(
          width: double.infinity,
          child: AMapWidget(
            ///是否显示路况
            trafficEnabled: true,
            initialCameraPosition: state.cameraPosition!,
            privacyStatement: P.AMapUtil.amapPrivacyStatement,
            apiKey: P.AMapUtil.amapApiKeys,
            onMapCreated: (AMapController c) =>
                dispatch(AMapHomeActionCreator.onMapCreateAction(c)),
            myLocationStyleOptions: MyLocationStyleOptions(true),
            onLocationChanged: (AMapLocation aMapLocation) => dispatch(
                AMapHomeActionCreator.onLocationChangedAction(aMapLocation)),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.red,
        ),
      )
    ],
  );
}
