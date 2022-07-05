// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleModel _$SimpleModelFromJson(Map json) => SimpleModel()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = json['data'];

Map<String, dynamic> _$SimpleModelToJson(SimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

IntSimpleModel _$IntSimpleModelFromJson(Map json) => IntSimpleModel()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = json['data'] as int?;

Map<String, dynamic> _$IntSimpleModelToJson(IntSimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

StringSimpleModel _$StringSimpleModelFromJson(Map json) => StringSimpleModel()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = json['data'] as String?;

Map<String, dynamic> _$StringSimpleModelToJson(StringSimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
