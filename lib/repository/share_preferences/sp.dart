import 'package:flutter_wanandroid/helper/sp_helper.dart';

class SpAppKey {
  static const String _one = "one";
  static const String _cookie = "cookie";
  static const String _expires = "expires";
  static const String _username = "username";
  static const String _password = "password";

  static const List<String> allKey = [
    _one,
    _cookie,
    _expires,
    _username,
    _password
  ];
}

class SpUtil {
  static Future<bool> setCookie(String value) {
    return SpHelper.putString(SpAppKey._cookie, value);
  }

  static Future<bool> setCookieExpires(String value) {
    return SpHelper.putString(SpAppKey._expires, value);
  }

  static Future<bool> setUserName(String value) {
    return SpHelper.putString(SpAppKey._username, value);
  }

  static Future<bool> setPassword(String value) {
    return SpHelper.putString(SpAppKey._password, value);
  }

  static Future<String?> getCookie() {
    return SpHelper.getString(SpAppKey._cookie);
  }

  static Future<String?> getCookieExpires() {
    return SpHelper.getString(SpAppKey._expires);
  }

  static Future<String?> getUserName() {
    return SpHelper.getString(SpAppKey._username);
  }

  static Future<String?> getPassword() {
    return SpHelper.getString(SpAppKey._password);
  }

  static Future<bool> logout() async {
    await SpHelper.remove(SpAppKey._username);
    await SpHelper.remove(SpAppKey._password);
    return true;
  }
}
