import 'dart:math';

import 'package:flutter_wanandroid/models/db/db_model.dart';
import 'package:flutter_wanandroid/repository/database/database_helper.dart';
import 'package:flutter_wanandroid/repository/database/database_keys.dart';
import 'package:sqflite/sqflite.dart';

class CommonDb {
  ///清空用户数据
  static Future<bool> clearAllDbs() async {
    List<Map<String, dynamic>> tables = await DbHelper.instance.rawQuery(
        "select name from sqlite_master where type='table' and name!='sqlite_sequence'");
    return DbHelper.instance.transaction((txn) async {
      var batch = txn.batch();
      for (Map<String, dynamic> table in tables) {
        if (((table['name'] ?? '') as String).startsWith('u_')) {
          batch.delete(table['name']);
        }
      }
      await batch.commit(noResult: true);
      return true;
    });
  }

  ///更新历史搜索表
  static Future<int> updateSearchHistoryLog(UserSearchLog log) {
    return DbHelper.instance.insert(
        TUserSearchHistoryProperty.TABLE_NAME, log.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///根据time排序获取搜索历史记录
  static Future<List<UserSearchLog>> getAllSearchHistoryLog(
      {String sc = "desc"}) {
    return DbHelper.instance
        .query(TUserSearchHistoryProperty.TABLE_NAME,
            orderBy: "${TUserSearchHistoryProperty.cTime} $sc")
        .then((items) {
      List<UserSearchLog> logs = [];
      items.forEach((element) => logs.add(UserSearchLog.fromJson(element)));
      return logs;
    });
  }

  ///清空历史搜索表
  static Future<int> deleteUserSearchHistory() {
    return DbHelper.instance.delete(TUserSearchHistoryProperty.TABLE_NAME);
  }
}