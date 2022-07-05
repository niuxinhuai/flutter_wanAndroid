import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginWrap extends CommonModel<LoginData> {
  LoginWrap();

  factory LoginWrap.fromJson(Map<String, dynamic> json) =>
      _$LoginWrapFromJson(json);

  toJson() => _$LoginWrapToJson(this);
}

@JsonSerializable()
class LoginData {
  LoginData();

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  toJson() => _$LoginDataToJson(this);
}
