// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerWrap _$HomeBannerWrapFromJson(Map<String, dynamic> json) =>
    HomeBannerWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => HomeBannerBean.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HomeBannerWrapToJson(HomeBannerWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HomeBannerBean _$HomeBannerBeanFromJson(Map<String, dynamic> json) =>
    HomeBannerBean()
      ..desc = json['desc'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..imagePath = json['imagePath'] as String?
      ..isVisible = (json['isVisible'] as num?)?.toInt()
      ..order = (json['order'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = (json['type'] as num?)?.toInt()
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
