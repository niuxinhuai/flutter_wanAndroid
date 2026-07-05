// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherStage _$WeatherStageFromJson(Map<String, dynamic> json) => WeatherStage()
  ..status = json['status'] as String?
  ..api_version = json['api_version'] as String?
  ..api_status = json['api_status'] as String?
  ..lang = json['lang'] as String?
  ..unit = json['unit'] as String?
  ..tzshift = (json['tzshift'] as num?)?.toInt()
  ..timezone = json['timezone'] as String?
  ..server_time = (json['server_time'] as num?)?.toInt()
  ..location = (json['location'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..result = json['result'] == null
      ? null
      : WeatherResult.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherStageToJson(WeatherStage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'api_version': instance.api_version,
      'api_status': instance.api_status,
      'lang': instance.lang,
      'unit': instance.unit,
      'tzshift': instance.tzshift,
      'timezone': instance.timezone,
      'server_time': instance.server_time,
      'location': instance.location,
      'result': instance.result,
    };

WeatherResult _$WeatherResultFromJson(Map<String, dynamic> json) =>
    WeatherResult()
      ..daily = json['daily'] == null
          ? null
          : WeatherResultDaily.fromJson(json['daily'] as Map<String, dynamic>)
      ..realtime = json['realtime'] == null
          ? null
          : WeatherResultRealTime.fromJson(
              json['realtime'] as Map<String, dynamic>)
      ..hourly = json['hourly'] == null
          ? null
          : WeatherHourly.fromJson(json['hourly'] as Map<String, dynamic>)
      ..alert = json['alert'] == null
          ? null
          : WeatherResultAlert.fromJson(json['alert'] as Map<String, dynamic>)
      ..primary = (json['primary'] as num?)?.toInt()
      ..forecast_keypoint = json['forecast_keypoint'] as String?;

Map<String, dynamic> _$WeatherResultToJson(WeatherResult instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'realtime': instance.realtime,
      'hourly': instance.hourly,
      'alert': instance.alert,
      'primary': instance.primary,
      'forecast_keypoint': instance.forecast_keypoint,
    };

WeatherResultAlert _$WeatherResultAlertFromJson(Map<String, dynamic> json) =>
    WeatherResultAlert()
      ..status = json['status'] as String?
      ..content = (json['content'] as List<dynamic>?)
          ?.map((e) => AlertContent.fromJson(e as Map<String, dynamic>))
          .toList()
      ..adcodes = (json['adcodes'] as List<dynamic>?)
          ?.map((e) => AlertAdcodes.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WeatherResultAlertToJson(WeatherResultAlert instance) =>
    <String, dynamic>{
      'status': instance.status,
      'content': instance.content,
      'adcodes': instance.adcodes,
    };

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) =>
    WeatherHourly()
      ..status = json['status'] as String?
      ..description = json['description'] as String?
      ..precipitation = (json['precipitation'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..temperature = (json['temperature'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..apparent_temperature = (json['apparent_temperature'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wind = (json['wind'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..humidity = (json['humidity'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..cloudrate = (json['cloudrate'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..skycon = (json['skycon'] as List<dynamic>?)
          ?.map((e) => HourlySkycon.fromJson(e as Map<String, dynamic>))
          .toList()
      ..pressure = (json['pressure'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..visibility = (json['visibility'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..dswrf = (json['dswrf'] as List<dynamic>?)
          ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..air_quality = json['air_quality'] == null
          ? null
          : HourlyAir.fromJson(json['air_quality'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'status': instance.status,
      'description': instance.description,
      'precipitation': instance.precipitation,
      'temperature': instance.temperature,
      'apparent_temperature': instance.apparent_temperature,
      'wind': instance.wind,
      'humidity': instance.humidity,
      'cloudrate': instance.cloudrate,
      'skycon': instance.skycon,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
      'dswrf': instance.dswrf,
      'air_quality': instance.air_quality,
    };

WeatherResultDaily _$WeatherResultDailyFromJson(Map<String, dynamic> json) =>
    WeatherResultDaily()
      ..status = json['status'] as String?
      ..astro = (json['astro'] as List<dynamic>?)
          ?.map((e) => DailyAstro.fromJson(e as Map<String, dynamic>))
          .toList()
      ..precipitation = (json['precipitation'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..temperature = (json['temperature'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wind = (json['wind'] as List<dynamic>?)
          ?.map((e) => DailyItemSpeed.fromJson(e as Map<String, dynamic>))
          .toList()
      ..humidity = (json['humidity'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..cloudrate = (json['cloudrate'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..pressure = (json['pressure'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..visibility = (json['visibility'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..dswrf = (json['dswrf'] as List<dynamic>?)
          ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..air_quality = json['air_quality'] == null
          ? null
          : DailyAir.fromJson(json['air_quality'] as Map<String, dynamic>)
      ..skycon = (json['skycon'] as List<dynamic>?)
          ?.map((e) => DailySkyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..skycon_08h_20h = (json['skycon_08h_20h'] as List<dynamic>?)
          ?.map((e) => DailySkyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..skycon_20h_32h = (json['skycon_20h_32h'] as List<dynamic>?)
          ?.map((e) => DailySkyItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..life_index = json['life_index'] == null
          ? null
          : DailyLifeIndex.fromJson(json['life_index'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherResultDailyToJson(WeatherResultDaily instance) =>
    <String, dynamic>{
      'status': instance.status,
      'astro': instance.astro,
      'precipitation': instance.precipitation,
      'temperature': instance.temperature,
      'wind': instance.wind,
      'humidity': instance.humidity,
      'cloudrate': instance.cloudrate,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
      'dswrf': instance.dswrf,
      'air_quality': instance.air_quality,
      'skycon': instance.skycon,
      'skycon_08h_20h': instance.skycon_08h_20h,
      'skycon_20h_32h': instance.skycon_20h_32h,
      'life_index': instance.life_index,
    };

DailyAstro _$DailyAstroFromJson(Map<String, dynamic> json) => DailyAstro()
  ..date = json['date'] as String?
  ..sunrise = json['sunrise'] == null
      ? null
      : AstroSunrise.fromJson(json['sunrise'] as Map<String, dynamic>)
  ..sunset = json['sunset'] == null
      ? null
      : AstroSunrise.fromJson(json['sunset'] as Map<String, dynamic>);

Map<String, dynamic> _$DailyAstroToJson(DailyAstro instance) =>
    <String, dynamic>{
      'date': instance.date,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

AstroSunrise _$AstroSunriseFromJson(Map<String, dynamic> json) =>
    AstroSunrise()..time = json['time'] as String?;

Map<String, dynamic> _$AstroSunriseToJson(AstroSunrise instance) =>
    <String, dynamic>{
      'time': instance.time,
    };

DailyAir _$DailyAirFromJson(Map<String, dynamic> json) => DailyAir()
  ..aqi = (json['aqi'] as List<dynamic>?)
      ?.map((e) => DailyItemChn.fromJson(e as Map<String, dynamic>))
      .toList()
  ..pm25 = (json['pm25'] as List<dynamic>?)
      ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$DailyAirToJson(DailyAir instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'pm25': instance.pm25,
    };

DailyLifeIndex _$DailyLifeIndexFromJson(Map<String, dynamic> json) =>
    DailyLifeIndex()
      ..ultraviolet = (json['ultraviolet'] as List<dynamic>?)
          ?.map((e) => DailyLifeItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..carWashing = (json['carWashing'] as List<dynamic>?)
          ?.map((e) => DailyLifeItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..dressing = (json['dressing'] as List<dynamic>?)
          ?.map((e) => DailyLifeItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..comfort = (json['comfort'] as List<dynamic>?)
          ?.map((e) => DailyLifeItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..coldRisk = (json['coldRisk'] as List<dynamic>?)
          ?.map((e) => DailyLifeItem.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DailyLifeIndexToJson(DailyLifeIndex instance) =>
    <String, dynamic>{
      'ultraviolet': instance.ultraviolet,
      'carWashing': instance.carWashing,
      'dressing': instance.dressing,
      'comfort': instance.comfort,
      'coldRisk': instance.coldRisk,
    };

DailyItem _$DailyItemFromJson(Map<String, dynamic> json) => DailyItem()
  ..date = json['date'] as String?
  ..max = (json['max'] as num?)?.toDouble()
  ..min = (json['min'] as num?)?.toDouble()
  ..avg = (json['avg'] as num?)?.toDouble();

Map<String, dynamic> _$DailyItemToJson(DailyItem instance) => <String, dynamic>{
      'date': instance.date,
      'max': instance.max,
      'min': instance.min,
      'avg': instance.avg,
    };

DailyItemSpeed _$DailyItemSpeedFromJson(Map<String, dynamic> json) =>
    DailyItemSpeed()
      ..date = json['date'] as String?
      ..max = json['max'] == null
          ? null
          : DailyChildSpeed.fromJson(json['max'] as Map<String, dynamic>)
      ..min = json['min'] == null
          ? null
          : DailyChildSpeed.fromJson(json['min'] as Map<String, dynamic>)
      ..avg = json['avg'] == null
          ? null
          : DailyChildSpeed.fromJson(json['avg'] as Map<String, dynamic>);

Map<String, dynamic> _$DailyItemSpeedToJson(DailyItemSpeed instance) =>
    <String, dynamic>{
      'date': instance.date,
      'max': instance.max,
      'min': instance.min,
      'avg': instance.avg,
    };

DailyItemChn _$DailyItemChnFromJson(Map<String, dynamic> json) => DailyItemChn()
  ..date = json['date'] as String?
  ..max = json['max'] == null
      ? null
      : DailyChildChn.fromJson(json['max'] as Map<String, dynamic>)
  ..min = json['min'] == null
      ? null
      : DailyChildChn.fromJson(json['min'] as Map<String, dynamic>)
  ..avg = json['avg'] == null
      ? null
      : DailyChildChn.fromJson(json['avg'] as Map<String, dynamic>);

Map<String, dynamic> _$DailyItemChnToJson(DailyItemChn instance) =>
    <String, dynamic>{
      'date': instance.date,
      'max': instance.max,
      'min': instance.min,
      'avg': instance.avg,
    };

DailyChildSpeed _$DailyChildSpeedFromJson(Map<String, dynamic> json) =>
    DailyChildSpeed()
      ..speed = (json['speed'] as num?)?.toDouble()
      ..direction = (json['direction'] as num?)?.toDouble();

Map<String, dynamic> _$DailyChildSpeedToJson(DailyChildSpeed instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'direction': instance.direction,
    };

DailyChildChn _$DailyChildChnFromJson(Map<String, dynamic> json) =>
    DailyChildChn()
      ..chn = (json['chn'] as num?)?.toInt()
      ..usa = (json['usa'] as num?)?.toInt();

Map<String, dynamic> _$DailyChildChnToJson(DailyChildChn instance) =>
    <String, dynamic>{
      'chn': instance.chn,
      'usa': instance.usa,
    };

DailySkyItem _$DailySkyItemFromJson(Map<String, dynamic> json) => DailySkyItem()
  ..date = json['date'] as String?
  ..value = json['value'] as String?;

Map<String, dynamic> _$DailySkyItemToJson(DailySkyItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'value': instance.value,
    };

DailyLifeItem _$DailyLifeItemFromJson(Map<String, dynamic> json) =>
    DailyLifeItem()
      ..date = json['date'] as String?
      ..index = json['index'] as String?
      ..desc = json['desc'] as String?;

Map<String, dynamic> _$DailyLifeItemToJson(DailyLifeItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'index': instance.index,
      'desc': instance.desc,
    };

WeatherResultRealTime _$WeatherResultRealTimeFromJson(
        Map<String, dynamic> json) =>
    WeatherResultRealTime()
      ..status = json['status'] as String?
      ..temperature = (json['temperature'] as num?)?.toDouble()
      ..humidity = (json['humidity'] as num?)?.toDouble()
      ..cloudrate = (json['cloudrate'] as num?)?.toDouble()
      ..skycon = json['skycon'] as String?
      ..visibility = (json['visibility'] as num?)?.toDouble()
      ..dswrf = (json['dswrf'] as num?)?.toDouble()
      ..pressure = (json['pressure'] as num?)?.toDouble()
      ..apparent_temperature =
          (json['apparent_temperature'] as num?)?.toDouble()
      ..wind = json['wind'] == null
          ? null
          : RealTimeWind.fromJson(json['wind'] as Map<String, dynamic>)
      ..precipitation = json['precipitation'] == null
          ? null
          : RealTimePrecipitation.fromJson(
              json['precipitation'] as Map<String, dynamic>)
      ..air_quality = json['air_quality'] == null
          ? null
          : RealTimeAir.fromJson(json['air_quality'] as Map<String, dynamic>)
      ..life_index = json['life_index'] == null
          ? null
          : RealTimeLife.fromJson(json['life_index'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherResultRealTimeToJson(
        WeatherResultRealTime instance) =>
    <String, dynamic>{
      'status': instance.status,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'cloudrate': instance.cloudrate,
      'skycon': instance.skycon,
      'visibility': instance.visibility,
      'dswrf': instance.dswrf,
      'pressure': instance.pressure,
      'apparent_temperature': instance.apparent_temperature,
      'wind': instance.wind,
      'precipitation': instance.precipitation,
      'air_quality': instance.air_quality,
      'life_index': instance.life_index,
    };

RealTimeWind _$RealTimeWindFromJson(Map<String, dynamic> json) => RealTimeWind()
  ..speed = (json['speed'] as num?)?.toDouble()
  ..direction = (json['direction'] as num?)?.toDouble();

Map<String, dynamic> _$RealTimeWindToJson(RealTimeWind instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'direction': instance.direction,
    };

RealTimePrecipitation _$RealTimePrecipitationFromJson(
        Map<String, dynamic> json) =>
    RealTimePrecipitation()
      ..local = json['local'] == null
          ? null
          : PrecipitationLocal.fromJson(json['local'] as Map<String, dynamic>)
      ..nearest = json['nearest'] == null
          ? null
          : PrecipitationNearest.fromJson(
              json['nearest'] as Map<String, dynamic>);

Map<String, dynamic> _$RealTimePrecipitationToJson(
        RealTimePrecipitation instance) =>
    <String, dynamic>{
      'local': instance.local,
      'nearest': instance.nearest,
    };

PrecipitationLocal _$PrecipitationLocalFromJson(Map<String, dynamic> json) =>
    PrecipitationLocal()
      ..status = json['status'] as String?
      ..datasource = json['datasource'] as String?
      ..intensity = (json['intensity'] as num?)?.toDouble();

Map<String, dynamic> _$PrecipitationLocalToJson(PrecipitationLocal instance) =>
    <String, dynamic>{
      'status': instance.status,
      'datasource': instance.datasource,
      'intensity': instance.intensity,
    };

PrecipitationNearest _$PrecipitationNearestFromJson(
        Map<String, dynamic> json) =>
    PrecipitationNearest()
      ..status = json['status'] as String?
      ..distance = (json['distance'] as num?)?.toDouble()
      ..intensity = (json['intensity'] as num?)?.toDouble();

Map<String, dynamic> _$PrecipitationNearestToJson(
        PrecipitationNearest instance) =>
    <String, dynamic>{
      'status': instance.status,
      'distance': instance.distance,
      'intensity': instance.intensity,
    };

RealTimeAir _$RealTimeAirFromJson(Map<String, dynamic> json) => RealTimeAir()
  ..pm25 = (json['pm25'] as num?)?.toInt()
  ..pm10 = (json['pm10'] as num?)?.toInt()
  ..o3 = (json['o3'] as num?)?.toInt()
  ..so2 = (json['so2'] as num?)?.toInt()
  ..no2 = (json['no2'] as num?)?.toInt()
  ..co = (json['co'] as num?)?.toDouble()
  ..aqi = json['aqi'] == null
      ? null
      : AirAqi.fromJson(json['aqi'] as Map<String, dynamic>)
  ..description = json['description'] == null
      ? null
      : AirDescription.fromJson(json['description'] as Map<String, dynamic>);

Map<String, dynamic> _$RealTimeAirToJson(RealTimeAir instance) =>
    <String, dynamic>{
      'pm25': instance.pm25,
      'pm10': instance.pm10,
      'o3': instance.o3,
      'so2': instance.so2,
      'no2': instance.no2,
      'co': instance.co,
      'aqi': instance.aqi,
      'description': instance.description,
    };

AirAqi _$AirAqiFromJson(Map<String, dynamic> json) => AirAqi()
  ..chn = (json['chn'] as num?)?.toInt()
  ..usa = (json['usa'] as num?)?.toInt();

Map<String, dynamic> _$AirAqiToJson(AirAqi instance) => <String, dynamic>{
      'chn': instance.chn,
      'usa': instance.usa,
    };

AirDescription _$AirDescriptionFromJson(Map<String, dynamic> json) =>
    AirDescription()
      ..chn = json['chn'] as String?
      ..usa = json['usa'] as String?;

Map<String, dynamic> _$AirDescriptionToJson(AirDescription instance) =>
    <String, dynamic>{
      'chn': instance.chn,
      'usa': instance.usa,
    };

RealTimeLife _$RealTimeLifeFromJson(Map<String, dynamic> json) => RealTimeLife()
  ..ultraviolet = json['ultraviolet'] == null
      ? null
      : LifeUltraviolet.fromJson(json['ultraviolet'] as Map<String, dynamic>)
  ..comfort = json['comfort'] == null
      ? null
      : LifeComfort.fromJson(json['comfort'] as Map<String, dynamic>);

Map<String, dynamic> _$RealTimeLifeToJson(RealTimeLife instance) =>
    <String, dynamic>{
      'ultraviolet': instance.ultraviolet,
      'comfort': instance.comfort,
    };

LifeUltraviolet _$LifeUltravioletFromJson(Map<String, dynamic> json) =>
    LifeUltraviolet()
      ..index = (json['index'] as num?)?.toDouble()
      ..desc = json['desc'] as String?;

Map<String, dynamic> _$LifeUltravioletToJson(LifeUltraviolet instance) =>
    <String, dynamic>{
      'index': instance.index,
      'desc': instance.desc,
    };

LifeComfort _$LifeComfortFromJson(Map<String, dynamic> json) => LifeComfort()
  ..index = (json['index'] as num?)?.toDouble()
  ..desc = json['desc'] as String?;

Map<String, dynamic> _$LifeComfortToJson(LifeComfort instance) =>
    <String, dynamic>{
      'index': instance.index,
      'desc': instance.desc,
    };

HourlyPrecipitation _$HourlyPrecipitationFromJson(Map<String, dynamic> json) =>
    HourlyPrecipitation()
      ..datetime = json['datetime'] as String?
      ..value = (json['value'] as num?)?.toDouble()
      ..probability = (json['probability'] as num?)?.toDouble()
      ..speed = (json['speed'] as num?)?.toDouble()
      ..direction = (json['direction'] as num?)?.toDouble();

Map<String, dynamic> _$HourlyPrecipitationToJson(
        HourlyPrecipitation instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'value': instance.value,
      'probability': instance.probability,
      'speed': instance.speed,
      'direction': instance.direction,
    };

HourlySkycon _$HourlySkyconFromJson(Map<String, dynamic> json) => HourlySkycon()
  ..datetime = json['datetime'] as String?
  ..value = json['value'] as String?;

Map<String, dynamic> _$HourlySkyconToJson(HourlySkycon instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'value': instance.value,
    };

HourlyAir _$HourlyAirFromJson(Map<String, dynamic> json) => HourlyAir()
  ..aqi = (json['aqi'] as List<dynamic>?)
      ?.map((e) => HourlyAirAqi.fromJson(e as Map<String, dynamic>))
      .toList()
  ..pm25 = (json['pm25'] as List<dynamic>?)
      ?.map((e) => HourlyPrecipitation.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$HourlyAirToJson(HourlyAir instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'pm25': instance.pm25,
    };

HourlyAirAqi _$HourlyAirAqiFromJson(Map<String, dynamic> json) => HourlyAirAqi()
  ..datetime = json['datetime'] as String?
  ..value = json['value'] == null
      ? null
      : DailyChildChn.fromJson(json['value'] as Map<String, dynamic>);

Map<String, dynamic> _$HourlyAirAqiToJson(HourlyAirAqi instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'value': instance.value,
    };

AlertContent _$AlertContentFromJson(Map<String, dynamic> json) => AlertContent()
  ..province = json['province'] as String?
  ..status = json['status'] as String?
  ..code = json['code'] as String?
  ..description = json['description'] as String?
  ..regionId = json['regionId'] as String?
  ..county = json['county'] as String?
  ..alertId = json['alertId'] as String?
  ..title = json['title'] as String?
  ..adcode = json['adcode'] as String?
  ..source = json['source'] as String?
  ..location = json['location'] as String?
  ..request_status = json['request_status'] as String?
  ..latlon = (json['latlon'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList();

Map<String, dynamic> _$AlertContentToJson(AlertContent instance) =>
    <String, dynamic>{
      'province': instance.province,
      'status': instance.status,
      'code': instance.code,
      'description': instance.description,
      'regionId': instance.regionId,
      'county': instance.county,
      'alertId': instance.alertId,
      'title': instance.title,
      'adcode': instance.adcode,
      'source': instance.source,
      'location': instance.location,
      'request_status': instance.request_status,
      'latlon': instance.latlon,
    };

AlertAdcodes _$AlertAdcodesFromJson(Map<String, dynamic> json) => AlertAdcodes()
  ..adcode = (json['adcode'] as num?)?.toDouble()
  ..name = json['name'] as String?;

Map<String, dynamic> _$AlertAdcodesToJson(AlertAdcodes instance) =>
    <String, dynamic>{
      'adcode': instance.adcode,
      'name': instance.name,
    };
