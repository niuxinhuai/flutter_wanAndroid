// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWrap _$LoginWrapFromJson(Map<String, dynamic> json) => LoginWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = (json['errorCode'] as num?)?.toInt()
  ..data = json['data'] == null
      ? null
      : LoginData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginWrapToJson(LoginWrap instance) => <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData();

Map<String, dynamic> _$LoginDataToJson(LoginData instance) =>
    <String, dynamic>{};
