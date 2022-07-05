// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWrap _$LoginWrapFromJson(Map json) => LoginWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = json['data'] == null
      ? null
      : LoginData.fromJson(Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$LoginWrapToJson(LoginWrap instance) => <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map json) => LoginData();

Map<String, dynamic> _$LoginDataToJson(LoginData instance) =>
    <String, dynamic>{};
