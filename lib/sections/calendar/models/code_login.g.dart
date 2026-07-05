// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeLoginWrap _$CodeLoginWrapFromJson(Map<String, dynamic> json) =>
    CodeLoginWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = json['data'] == null
          ? null
          : CodeLoginStage.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CodeLoginWrapToJson(CodeLoginWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

CodeLoginStage _$CodeLoginStageFromJson(Map<String, dynamic> json) =>
    CodeLoginStage()
      ..openId = json['openId'] as String?
      ..access_token = json['access_token'] as String?
      ..refresh_token = json['refresh_token'] as String?
      ..token_type = json['token_type'] as String?
      ..expires_in = (json['expires_in'] as num?)?.toInt()
      ..isNewRegisted = json['isNewRegisted'] as bool?;

Map<String, dynamic> _$CodeLoginStageToJson(CodeLoginStage instance) =>
    <String, dynamic>{
      'openId': instance.openId,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'isNewRegisted': instance.isNewRegisted,
    };
