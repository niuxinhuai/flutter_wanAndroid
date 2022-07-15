class WeatherSkyMode {
  WeatherSkyMode(this.skyKey, this.skyDes, this.assetName);
  String? skyKey;
  String? skyDes;
  String? assetName;
}

class WeatherUtil {
  ///天气现象对照表
  static Map<String, WeatherSkyMode> _skyMap() => {
        "CLEAR_DAY": WeatherSkyMode("CLEAR_DAY", "晴", "0.png"),
        "CLEAR_NIGHT": WeatherSkyMode("CLEAR_NIGHT", "晴", "2.png"),
        "PARTLY_CLOUDY_DAY": WeatherSkyMode("PARTLY_CLOUDY_DAY", "多云", "1.png"),
        "PARTLY_CLOUDY_NIGHT":
            WeatherSkyMode("PARTLY_CLOUDY_NIGHT", "多云", "2.png"),
        "CLOUDY": WeatherSkyMode("CLOUDY", "阴", "2.png"),
        "LIGHT_HAZE": WeatherSkyMode("LIGHT_HAZE", "轻度雾霾", "49.png"),
        "MODERATE_HAZE": WeatherSkyMode("MODERATE_HAZE", "中度雾霾", "58.png"),
        "HEAVY_HAZE": WeatherSkyMode("HEAVY_HAZE", "重度雾霾", "57.png"),
        "LIGHT_RAIN": WeatherSkyMode("LIGHT_RAIN", "小雨", "7.png"),
        "MODERATE_RAIN": WeatherSkyMode("MODERATE_RAIN", "中雨", "8.png"),
        "HEAVY_RAIN": WeatherSkyMode("HEAVY_RAIN", "大雨", "22.png"),
        "STORM_RAIN": WeatherSkyMode("STORM_RAIN", "暴雨", "9.png"),
        "FOG": WeatherSkyMode("FOG", "雾", "18.png"),
        "LIGHT_SNOW": WeatherSkyMode("LIGHT_SNOW", "小雪", "14.png"),
        "MODERATE_SNOW": WeatherSkyMode("MODERATE_SNOW", "中雪", "15.png"),
        "HEAVY_SNOW": WeatherSkyMode("HEAVY_SNOW", "大雪", "16.png"),
        "STORM_SNOW": WeatherSkyMode("STORM_SNOW", "暴雪", "17.png"),
        "DUST": WeatherSkyMode("DUST", "浮尘", "53.png"),
        "SAND": WeatherSkyMode("SAND", "沙尘", "54.png"),
        "WIND": WeatherSkyMode("WIND", "大风", "55.png")
      };

  ///获取当前天气状况
  static String getWeatherSkyicon(String key) {
    if (_skyMap().keys.contains(key)) {
      return (_skyMap()[key] as WeatherSkyMode).skyDes!;
    }
    return "未知";
  }

  static List<String> weekdays = ["", "周一", "周二", "周三", "周四", "周五", "周六", "周日"];

  ///类型编码对照表
  static Map<String, String> _codeTypeMap() => {
        "01": "台风",
        "02": "暴雨",
        "03": "暴雪",
        "04": "寒潮",
        "05": "大风",
        "06": "沙尘暴",
        "07": "高温",
        "08": "干旱",
        "09": "雷电",
        "10": "冰雹",
        "11": "霜冻",
        "12": "大雾",
        "13": "霾",
        "14": "道路结冰",
        "15": "森林火灾",
        "16": "雷雨大风",
        "17": "春季沙尘天气趋势预警",
        "18": "沙尘",
      };

  ///级别编码对照表
  static Map<String, String> _codeLevelMap() =>
      {"00": "白色", "01": "蓝色", "02": "黄色", "03": "橙色", "04": "红色"};

  ///获取预警信息
  static String getWeatherAlert(String code) {
    if (code.length == 4) {
      String type = code.substring(0, 2);
      String level = code.substring(2, 4);
      String? typeStr = _codeTypeMap()[type];
      String? levelStr = _codeLevelMap()[level];
      if (typeStr != null && levelStr != null) {
        return typeStr + levelStr;
      }
      return "解析出错";
    }
    return "未知警告$code";
  }
}
