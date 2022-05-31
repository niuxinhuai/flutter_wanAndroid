import 'package:flutter_wanandroid/repository/database/database_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'db_model.g.dart';

@JsonSerializable()
class UserSearchLog {
  UserSearchLog();

  @JsonKey(name: TUserSearchHistoryProperty.cKeyWord)
  String? keyWords;

  @JsonKey(name: TUserSearchHistoryProperty.cTime)
  int? time;

  factory UserSearchLog.fromJson(Map<String, dynamic> json) =>
      _$UserSearchLogFromJson(json);

  toJson() => _$UserSearchLogToJson(this);
}
