import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterWrap extends CommonModel<RegisterData> {
  RegisterWrap();

  factory RegisterWrap.fromJson(Map<String, dynamic> json) =>
      _$RegisterWrapFromJson(json);

  toJson() => _$RegisterWrapToJson(this);
}

@JsonSerializable()
class RegisterData {
  RegisterData();

  bool? admin;
  List? chapterTops;
  int? coinCount;
  List? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  toJson() => _$RegisterDataToJson(this);
}
