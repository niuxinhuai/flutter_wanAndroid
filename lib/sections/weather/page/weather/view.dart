import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';
import 'package:flutter_wanandroid/sections/weather/widget/header.dart';
import 'package:flutter_wanandroid/utils/weather_util.dart';
import 'package:flutter_wanandroid/widget/appbar.dart';
import 'package:flutter_wanandroid/widget/effect.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    appBar: GpAppBar(
      elevation: 0,
      leadingColors: Colors.white,
      leading: Container(),
      backgroundColor: Colors.transparent,
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
    ),
  );
}

Widget _buildBody(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTop(state, dispatch, viewService),

        ///温度预警
        if (state.messageMode != null)
          _buildTemperatureAlert(state, dispatch, viewService),

        ///空气质量
        _buildAirWidget(state, dispatch, viewService),

        ///24小时天气
        _buildHourlyWidget(state, dispatch, viewService),

        ///7天数据
        _buildDailyWidget(state, dispatch, viewService),

        ///生活指数
        _buildLifeWidget(state, dispatch, viewService)
      ],
    ),
  );
}

///top
Widget _buildTop(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 35),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          state.placeChildItem!.name!,
          style: textStyle.copyWith(fontSize: 35),
        ),
        Text(
          state.placeChildItem!.temperature ?? "",
          textAlign: TextAlign.center,
          style: GpOtherTheme.size20Green(viewService.context)!.copyWith(
              fontSize: 69,
              color: CommonColors.onPrimaryTextColor,
              fontWeight: FontWeight.w300),
        ),
        Text(
          '${WeatherUtil.getWeatherSkyicon(state.weatherStage!.result?.realtime?.skycon ?? "")}',
          style: textStyle,
        ),
        Text(
            "${state.placeChildItem!.max ?? ""} ${state.placeChildItem!.min ?? ""}",
            style: textStyle),
      ],
    ),
  );
}

///温度预警
Widget _buildTemperatureAlert(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );
  return Padding(
    padding: EdgeInsets.only(bottom: 15),
    child: EffectWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeatherItemHeaderWidget(
            text: state.messageMode?.header ?? "天气预警",
            textStyle: textStyle.copyWith(fontSize: 17),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              state.messageMode?.title ?? "",
              style: textStyle.copyWith(fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              state.messageMode?.desc ?? "",
              maxLines: 7,
              style: textStyle.copyWith(
                  color: CommonColors.textColorDDD, fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}

///空气质量
Widget _buildAirWidget(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );
  return EffectWidget(
//          decoration: BoxDecoration(color: Color(0xFF3490C6)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherItemHeaderWidget(
          text: "空气质量",
          textStyle: textStyle.copyWith(fontSize: 17),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.white,
        ),
        Text(
          "${state.weatherStage?.result?.realtime?.air_quality?.aqi?.chn} - ${state.weatherStage?.result?.realtime?.air_quality?.description?.chn}",
          style: textStyle.copyWith(fontSize: 27),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 40),
          child: Text(
            "当前AQI（CN）为${state.weatherStage?.result?.realtime?.air_quality?.aqi?.chn}",
            style: textStyle.copyWith(fontSize: 20),
          ),
        )
      ],
    ),
  );
}

///24小时天气
Widget _buildHourlyWidget(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );

  return Padding(
    padding: EdgeInsets.only(top: 15, bottom: 15),
    child: EffectWidget(
      padding: EdgeInsets.only(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: WeatherItemHeaderWidget(
              text: state.sectionMode?.description ?? "24小时天气",
              textStyle: textStyle.copyWith(fontSize: 17),
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.white,
            margin: EdgeInsets.only(left: 15),
          ),
          Container(
            width: double.infinity,
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              children: state.sectionMode!.models!.map((e) {
                return Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.datetime ?? "时间",
                        style: textStyle.copyWith(fontSize: 17),
                      ),
                      Text(
                        e.skycon ?? "icon",
                        style: textStyle.copyWith(fontSize: 14),
                      ),
                      Text(
                        e.value ?? "温度",
                        style: textStyle.copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

///未来七天的数据
Widget _buildDailyWidget(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );
  return EffectWidget(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherItemHeaderWidget(
          text: "${state.dailyModels!.length}日天气预报",
          textStyle: textStyle.copyWith(fontSize: 17),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.white,
        ),
        Container(
          height: 80.0 * state.dailyModels!.length,
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                DailyChildModel model = state.dailyModels![index];
                return Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.weekday ?? "",
                        style: textStyle,
                      ),
                      Text(
                        model.skycon ?? "",
                        style: textStyle,
                      ),
                      Text(
                        model.min ?? "",
                        style: textStyle,
                      ),
                      Text(
                        model.max ?? "",
                        style: textStyle,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 15),
                  color: CommonColors.divider,
                  height: 0.5,
                  width: double.infinity,
                );
              },
              itemCount: state.dailyModels!.length),
        )
      ],
    ),
  );
}

///生活指数
Widget _buildLifeWidget(
    WeatherState state, Dispatch dispatch, ViewService viewService) {
  TextStyle textStyle = GpOtherTheme.size17(viewService.context)!.copyWith(
    fontSize: 20,
    color: CommonColors.onPrimaryTextColor,
  );
  return Padding(
    padding: EdgeInsets.only(top: 15),
    child: EffectWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherItemHeaderWidget(
          text: "生活指数",
          textStyle: textStyle.copyWith(fontSize: 17),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.white,
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 1.7,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 20),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: state.lifeModels!
              .map((e) => _buildLifeItem(e, viewService.context))
              .toList(),
        )
      ],
    )),
  );
}

Widget _buildLifeItem(DailyLifeModel model, BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Icon(
            model.iconData,
            color: Colors.white,
            size: 40,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.title ?? "",
              style: GpOtherTheme.size15Grey(context)
                  .copyWith(color: CommonColors.textColorDDD),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                model.desc ?? "",
                style: GpOtherTheme.size17(context)!
                    .copyWith(color: CommonColors.onPrimaryTextColor),
              ),
            )
          ],
        )
      ],
    ),
  );
}
