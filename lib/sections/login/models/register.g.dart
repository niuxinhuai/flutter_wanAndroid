// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterWrap _$RegisterWrapFromJson(Map<String, dynamic> json) => RegisterWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = (json['errorCode'] as num?)?.toInt()
  ..data = json['data'] == null
      ? null
      : RegisterData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$RegisterWrapToJson(RegisterWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData()
  ..admin = json['admin'] as bool?
  ..chapterTops = json['chapterTops'] as List<dynamic>?
  ..coinCount = (json['coinCount'] as num?)?.toInt()
  ..collectIds = json['collectIds'] as List<dynamic>?
  ..email = json['email'] as String?
  ..icon = json['icon'] as String?
  ..id = (json['id'] as num?)?.toInt()
  ..nickname = json['nickname'] as String?
  ..password = json['password'] as String?
  ..publicName = json['publicName'] as String?
  ..token = json['token'] as String?
  ..type = (json['type'] as num?)?.toInt()
  ..username = json['username'] as String?;

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'coinCount': instance.coinCount,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };
