import 'package:flutter_wanandroid/repository/database/database_keys.dart';

class DBInitialize {
  static var dbInitList = [
    _createSearchLog,
    _createCollectLog,
    _createWeatherLog,
  ];

  static var _createSearchLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserSearchHistoryProperty.TABLE_NAME} (
	 ${TUserSearchHistoryProperty.cKeyWord} TEXT NOT NULL,
	 ${TUserSearchHistoryProperty.cTime} INTEGER NOT NULL,
	PRIMARY KEY(${TUserSearchHistoryProperty.cKeyWord})
)
  ''';

  static var _createCollectLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserCollectProperty.TABLE_NAME} (
	 ${TUserCollectProperty.cId} INTEGER NOT NULL,
	PRIMARY KEY(${TUserCollectProperty.cId})
)
  ''';

  static var _createWeatherLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserWeatherProperty.TABLE_NAME} (
   ${TUserWeatherProperty.cId} TEXT NOT NULL,
	 ${TUserWeatherProperty.cCity} TEXT NOT NULL,
	 ${TUserWeatherProperty.cLat} TEXT NOT NULL,
	 ${TUserWeatherProperty.cLng} TEXT NOT NULL,
	 ${TUserWeatherProperty.cInd} INTEGER NOT NULL,
	 PRIMARY KEY(${TUserWeatherProperty.cId})
)
  ''';
}
