import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/res/iconfont.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';
import 'package:flutter_wanandroid/utils/time_util.dart';
import 'package:flutter_wanandroid/utils/weather_util.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<WeatherState>? buildReducer() {
  return asReducer(
    <Object, Reducer<WeatherState>>{
      WeatherAction.action: _onAction,
      WeatherAction.didRefresh: _didRefresh,
    },
  );
}

WeatherState _onAction(WeatherState state, Action action) {
  final WeatherState newState = state.clone();
  return newState;
}

WeatherState _didRefresh(WeatherState state, Action action) {
  final WeatherState newState = state.clone();
  newState.sectionMode = null;
  newState.weatherStage = action.payload;

  List<DailyLifeModel> lifeModels = [];
  HourlySectionMode sectionMode = HourlySectionMode();
  PlaceChildItem placeChildItem = PlaceChildItem();
  placeChildItem.id = newState.cityPlace!.id;
  placeChildItem.name = newState.cityPlace!.name;

  if (newState.weatherStage?.result != null) {
    WeatherResult result = newState.weatherStage!.result!;

    if (result.realtime != null) {
      placeChildItem.skycon =
          '${WeatherUtil.getWeatherSkyicon(result.realtime?.skycon ?? "")}';
      placeChildItem.temperature =
          "${(result.realtime?.temperature ?? 0).toInt()}${state.temperature}";
    }

    ///alert
    if (result.alert?.content != null && result.alert?.content?.length != 0) {
      AlertContent first = result.alert!.content!.first;
      String str = WeatherUtil.getWeatherAlert(first.code!);
      AlertMessageMode messageMode = AlertMessageMode();
      messageMode.header = str;
      messageMode.title = first.title;
      messageMode.desc = first.description;
      newState.messageMode = messageMode;
    }

    ///找出7天数据中的当天日期中的太阳的升起与落下
    DailyAstro? astro;
    if (result.daily?.astro != null && result.daily?.astro!.length != 0) {
      astro = result.daily?.astro!.firstWhere((element) =>
          TimeUtil.isTodayByDateTime(DateTime.parse(element.date!)));
    }
    //"最高${state.dailyItem!.max?.round()}${state.temperature} 最低${state.dailyItem!.min?.round()}${state.temperature}"
//'${WeatherUtil.getWeatherSkyicon(state.weatherStage!.result?.realtime?.skycon ?? "")}'
    //"${(state.weatherStage!.result?.realtime?.temperature ?? 0).toInt()}${state.temperature}"
    //state.cityPlace!.name!
    ///温度相关
    if (result.daily?.temperature != null &&
        result.daily?.temperature!.length != 0) {
      List<DailyItem> temperature = result.daily!.temperature!;

      ///dailyItem
      DailyItem dailyItem = temperature.first;
      placeChildItem.max = "最高${dailyItem.max?.round()}${state.temperature}";
      placeChildItem.min = "最低${dailyItem.min?.round()}${state.temperature}";

      ///7日天气预报
      List<DailyChildModel> list = temperature.map((e) {
        DailyChildModel childModel = DailyChildModel();
        DateTime d = DateTime.parse(e.date!.split("T").first);
        childModel.dateTime = e.date;
        childModel.weekday = TimeUtil.isTodayByDateTime(d)
            ? "今天"
            : WeatherUtil.weekdays[d.weekday];
        childModel.max = "${e.max!.round()}${newState.temperature}";
        childModel.min = "${e.min!.round()}${newState.temperature}";
        return childModel;
      }).toList();

      if (newState.weatherStage?.result?.daily?.skycon != null &&
          newState.weatherStage?.result?.daily?.skycon!.length != 0) {
        List<DailySkyItem> skyconList =
            newState.weatherStage!.result!.daily!.skycon!;
        for (int i = 0; i < skyconList.length; ++i) {
          DailySkyItem item = skyconList[i];
          String sk = WeatherUtil.getWeatherSkyicon(item.value!);
          list[i].skycon = sk;
        }
      }
      newState.dailyModels = list;

      ///24小时数据
      sectionMode.description = result.forecast_keypoint;
      List<HourlyItemMode> models = result.hourly!.temperature!.map((e) {
        String splitStr = e.datetime!.split("T").last.split(":").first;

        if (splitStr.startsWith("0")) {
          splitStr = splitStr.replaceFirst("0", "");
        }
        HourlyItemMode mo = HourlyItemMode();
        mo.normal = splitStr;
        mo.datetime = TimeUtil.isNowHour(splitStr) ? "现在" : "$splitStr时";
        mo.value = "${e.value!.round()}${newState.temperature}";
        return mo;
      }).toList();

      if (result.hourly?.skycon != null && result.hourly?.skycon!.length != 0) {
        for (int i = 0; i < result.hourly!.skycon!.length; ++i) {
          HourlySkycon skycon = result.hourly!.skycon![i];
          if (i < models.length) {
            String sk = WeatherUtil.getWeatherSkyicon(skycon.value!);
            models[i].skycon = sk;
          }
        }
      }
      if (astro != null && models.length != 0) {
        //日出
        if (astro.sunrise?.time != null) {
          _resetData(astro.sunrise!.time!, models, true);
        }

        //日落
        if (astro.sunset?.time != null) {
          _resetData(astro.sunset!.time!, models, false);
        }
      }

      sectionMode.models = models;
    }

    ///生活指数
    if (newState.weatherStage?.result?.daily?.life_index != null) {
      DailyLifeIndex lifeIndex =
          newState.weatherStage!.result!.daily!.life_index!;

      ///感冒
      if (lifeIndex.coldRisk != null && lifeIndex.coldRisk?.length != 0) {
        DailyLifeItem item = lifeIndex.coldRisk!.first;
        DailyLifeModel lifeModel = DailyLifeModel();
        lifeModel.iconData = IconF.gaoman;
        lifeModel.title = "感冒";
        lifeModel.desc = item.desc;
        lifeModels.add(lifeModel);
      }

      ///穿衣
      if (lifeIndex.dressing != null && lifeIndex.dressing?.length != 0) {
        DailyLifeItem item = lifeIndex.dressing!.first;
        DailyLifeModel lifeModel = DailyLifeModel();
        lifeModel.iconData = IconF.yifu;
        lifeModel.title = "穿衣";
        lifeModel.desc = item.desc;
        lifeModels.add(lifeModel);
      }

      ///紫外线
      if (lifeIndex.ultraviolet != null && lifeIndex.ultraviolet?.length != 0) {
        DailyLifeItem item = lifeIndex.ultraviolet!.first;
        DailyLifeModel lifeModel = DailyLifeModel();
        lifeModel.iconData = IconF.taiyang;
        lifeModel.title = "紫外线";
        lifeModel.desc = item.desc;
        lifeModels.add(lifeModel);
      }

      ///感冒
      if (lifeIndex.carWashing != null && lifeIndex.carWashing?.length != 0) {
        DailyLifeItem item = lifeIndex.carWashing!.first;
        DailyLifeModel lifeModel = DailyLifeModel();
        lifeModel.iconData = IconF.qiche;
        lifeModel.title = "洗车";
        lifeModel.desc = item.desc;
        lifeModels.add(lifeModel);
      }
    }
  }

  newState.placeChildItem = placeChildItem;

  newState.sectionMode = sectionMode;
  newState.lifeModels = lifeModels;
  newState.loadingState = LoadingState.success;
  return newState;
}

void _resetData(String time, List<HourlyItemMode> models, bool isStart) {
  String splitStr = time.split(":").first;
  if (splitStr.startsWith("0")) {
    splitStr = splitStr.replaceFirst("0", "");
  }
  int? startT = int.tryParse(splitStr);
  int? modeT = int.tryParse(models.first.normal!);
  if (startT != null && modeT != null) {
    if (startT > modeT) {
      ///当前时间小于日出时间，将日出时间加入数据中
      for (int i = 0; i < models.length; ++i) {
        if (models[i].normal == splitStr) {
          HourlyItemMode mo = HourlyItemMode();
          mo.datetime = time;
          mo.skycon = isStart ? "日出" : "日落";
          mo.value = isStart ? "日出" : "日落";
          models.insert(i + 1, mo);
          break;
        }
      }
    }
  }
}
