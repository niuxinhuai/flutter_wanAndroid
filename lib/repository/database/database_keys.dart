///all database key

///历史搜索
class TUserSearchHistoryProperty {
  TUserSearchHistoryProperty._();

  static const String TABLE_NAME = "t_search_history";
  static const String cKeyWord = "key_wrod";
  static const String cTime = "time";
}

///收藏
class TUserCollectProperty {
  TUserCollectProperty._();

  static const String TABLE_NAME = "t_collect";
  static const String cId = "id";
}
