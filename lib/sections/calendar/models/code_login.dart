/// @author niuxinhuai
/// @date 2024/3/11 上午9:57
import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_login.g.dart';

@JsonSerializable()
class CodeLoginWrap extends CommonModel<CodeLoginStage> {
  CodeLoginWrap();

  factory CodeLoginWrap.fromJson(Map<String, dynamic> json) =>
      _$CodeLoginWrapFromJson(json);

  toJson() => _$CodeLoginWrapToJson(this);
}

@JsonSerializable()
class CodeLoginStage {
  CodeLoginStage();

  String? openId;
  String? access_token;
  String? refresh_token;
  String? token_type;
  int? expires_in;
  bool? isNewRegisted;

  factory CodeLoginStage.fromJson(Map<String, dynamic> json) =>
      _$CodeLoginStageFromJson(json);

  toJson() => _$CodeLoginStageToJson(this);
}
