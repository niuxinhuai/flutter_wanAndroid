import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PathUtil {
  static String? _cookiePath;
  static Future<String> get cookiePath async {
    if (_cookiePath == null) {
      var path = await getDatabasesPath();
      path = join(path, "cookie");
      await Directory(path).create(recursive: true);
      _cookiePath = path;
    }
    return _cookiePath!;
  }
}
