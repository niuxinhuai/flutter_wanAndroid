import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';
import 'package:flutter_wanandroid/sections/weather/page/place/page.dart';
import 'package:flutter_wanandroid/sections/weather/widget/place.dart';
import 'action.dart';
import 'state.dart';

Effect<WeatherState>? buildEffect() {
  return combineEffects(<Object, Effect<WeatherState>>{
    WeatherAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<WeatherState> ctx) {}

void _initState(Action action, Context<WeatherState> ctx) async {
  _requestWeatherRealTime(action, ctx);
}

void _requestWeatherRealTime(Action action, Context<WeatherState> ctx) async {
  double lat = ctx.state.cityPlace!.location!.lat!;
  double lng = ctx.state.cityPlace!.location!.lng!;

  ///综合天气
  WeatherStage stage = await CommonService.getWeather(lat, lng);
  /////实时天气
//  WeatherStage stage = await CommonService.getWeatherRealTime(lat, lng);

//  ///未来几天的天气
//  WeatherStage dailyStage = await CommonService.getWeatherDaily(lat, lng);
//
//  ///24小时天气
//  WeatherStage hourlyStage = await CommonService.getWeatherHourly(lat, lng);
  ctx.dispatch(WeatherActionCreator.didRefreshAction(stage));
}
