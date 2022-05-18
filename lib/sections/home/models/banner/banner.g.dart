// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerWrap _$HomeBannerWrapFromJson(Map json) => HomeBannerWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => HomeBannerBean.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$HomeBannerWrapToJson(HomeBannerWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HomeBannerBean _$HomeBannerBeanFromJson(Map json) => HomeBannerBean()
  ..desc = json['desc'] as String?
  ..id = json['id'] as int?
  ..imagePath = json['imagePath'] as String?
  ..isVisible = json['isVisible'] as int?
  ..order = json['order'] as int?
  ..title = json['title'] as String?
  ..type = json['type'] as int?
  ..url = json['url'] as String?;

Map<String, dynamic> _$HomeBannerBeanToJson(HomeBannerBean instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
