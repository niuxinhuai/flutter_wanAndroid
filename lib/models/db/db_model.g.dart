// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchLog _$UserSearchLogFromJson(Map json) => UserSearchLog()
  ..keyWords = json['key_wrod'] as String?
  ..time = json['time'] as int?;

Map<String, dynamic> _$UserSearchLogToJson(UserSearchLog instance) =>
    <String, dynamic>{
      'key_wrod': instance.keyWords,
      'time': instance.time,
    };
