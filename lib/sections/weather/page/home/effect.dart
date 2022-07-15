import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_wanandroid/models/db/db_model.dart';
import 'package:flutter_wanandroid/repository/database/common_database.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/widget/place.dart';
import 'package:flutter_wanandroid/widget/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<WeatherSegmentState>? buildEffect() {
  return combineEffects(<Object, Effect<WeatherSegmentState>>{
    WeatherSegmentAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    WeatherSegmentAction.onTapAddPlace: _onTapAddPlace,
    WeatherSegmentAction.onPageChanged: _onPageChanged,
    WeatherSegmentAction.onTapPoint: _onTapPoint,
  });
}

void _onAction(Action action, Context<WeatherSegmentState> ctx) {}

void _initState(Action action, Context<WeatherSegmentState> ctx) async {
  ctx.state.pageController = P.PageController(initialPage: 0, keepPage: true);

  List<UserWeatherLog> logs = await CommonDb.getAllWeather(sc: "asc");
  if (logs.length == 0) {
    PlaceStage placeStage = await CommonService.getWeatherPlace("杭州");
    insertDB(placeStage.places!.first, 0);

    ctx.dispatch(
        WeatherSegmentActionCreator.didRefreshAction(placeStage.places!.first));
  } else {
    List<CityPlace> list = [];
    for (int i = 0; i < logs.length; ++i) {
      UserWeatherLog weatherLog = logs[i];
      PlaceStage placeStage =
          await CommonService.getWeatherPlace(weatherLog.city!);
      if (placeStage.places != null && placeStage.places?.length != 0) {
        list.add(placeStage.places!.first);
      }
    }
    ctx.dispatch(WeatherSegmentActionCreator.didRefreshPageAction(list));
  }
}

void _onTapAddPlace(Action action, Context<WeatherSegmentState> ctx) {
  double? width = P.MediaQuery.of(ctx.context).size.width;
//  print(">>>>>>>>>width:$width");
  P.showModalBottomSheet(
      backgroundColor: P.Colors.transparent,
      context: ctx.context,
      builder: (P.BuildContext context) {
        return WeatherPlaceWidget(
          list: ctx.state.list,
          width: width,
          callback: (CityPlace place) {
            if (ctx.state.list!.length != 0) {
              for (CityPlace cityPlace in ctx.state.list!) {
                if (cityPlace.id == place.id) {
                  Toast.toast(ctx.context, "已经存在相同的地点了~");
                  break;
                }
              }

              insertDB(place, ctx.state.list!.length);
              ctx.dispatch(WeatherSegmentActionCreator.didRefreshAction(place));
              Future.delayed(Duration(milliseconds: 200), () {
                ctx.state.pageController!.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: P.Curves.easeInOut,
                );
              });
            }
            P.Navigator.pop(ctx.context);
          },
          deleteCallback: (String id) {
            CommonDb.deleteWeatherByCity(id);
            ctx.dispatch(
                WeatherSegmentActionCreator.didDeleteWeatherItemAction(id));
          },
          onReorderCallback: (int oldIndex, int newIndex) {
            CityPlace p = ctx.state.list!.removeAt(oldIndex);
            ctx.state.list!.insert(newIndex, p);

            ///更新顺序
            updateWeatherDb(action, ctx);
            ctx.dispatch(WeatherSegmentActionCreator.didReloadAction());
          },
        );
      });
}

void insertDB(CityPlace place, int index) {
  UserWeatherLog log = _replaceCityPlace(place, index);
  CommonDb.updateUserWeatherLog(log);
}

void _onPageChanged(Action action, Context<WeatherSegmentState> ctx) {
  ctx.dispatch(
      WeatherSegmentActionCreator.didPageChangedAction(action.payload));
}

void _onTapPoint(Action action, Context<WeatherSegmentState> ctx) {
  final int index = action.payload;
  ctx.state.pageController!.animateToPage(
    index,
    duration: const Duration(milliseconds: 200),
    curve: P.Curves.easeInOut,
  );
}

UserWeatherLog _replaceCityPlace(CityPlace cityPlace, int index) {
  UserWeatherLog log = UserWeatherLog();
  log.city_id = cityPlace.id;
  log.city = cityPlace.name;
  log.lat = "${cityPlace.location!.lat}";
  log.lng = "${cityPlace.location!.lng}";
  log.ind = index;
  return log;
}

void updateWeatherDb(Action action, Context<WeatherSegmentState> ctx) async {
  if (ctx.state.list!.length != 0) {
    List<UserWeatherLog> logs = [];
    for (int i = 0; i < ctx.state.list!.length; ++i) {
      CityPlace cityPlace = ctx.state.list![i];
      UserWeatherLog log = _replaceCityPlace(cityPlace, i);
      logs.add(log);
    }
    if (logs.length != 0) {
      await CommonDb.inserWeatherData(logs);
    }
  }
}

void _dispose(Action action, Context<WeatherSegmentState> ctx) async {
  ctx.state.pageController?.dispose();
}
