import 'package:flutter_wanandroid/repository/database/database_keys.dart';

class DBInitialize {
  static var dbInitList = [
    _createSearchLog,
  ];

  static var _createSearchLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserSearchHistoryProperty.TABLE_NAME} (
	 ${TUserSearchHistoryProperty.cKeyWord} TEXT NOT NULL,
	 ${TUserSearchHistoryProperty.cTime} INTEGER NOT NULL,
	PRIMARY KEY(${TUserSearchHistoryProperty.cKeyWord})
)
  ''';
}
