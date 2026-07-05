// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleModel _$SimpleModelFromJson(Map<String, dynamic> json) => SimpleModel()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = (json['errorCode'] as num?)?.toInt()
  ..data = json['data'];

Map<String, dynamic> _$SimpleModelToJson(SimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

IntSimpleModel _$IntSimpleModelFromJson(Map<String, dynamic> json) =>
    IntSimpleModel()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = (json['data'] as num?)?.toInt();

Map<String, dynamic> _$IntSimpleModelToJson(IntSimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

StringSimpleModel _$StringSimpleModelFromJson(Map<String, dynamic> json) =>
    StringSimpleModel()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = json['data'] as String?;

Map<String, dynamic> _$StringSimpleModelToJson(StringSimpleModel instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
