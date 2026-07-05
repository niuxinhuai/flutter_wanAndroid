// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchWrap _$SearchWrapFromJson(Map<String, dynamic> json) => SearchWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = (json['errorCode'] as num?)?.toInt()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => HotSearchItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SearchWrapToJson(SearchWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HotSearchItem _$HotSearchItemFromJson(Map<String, dynamic> json) =>
    HotSearchItem()
      ..id = (json['id'] as num?)?.toInt()
      ..link = json['link'] as String?
      ..name = json['name'] as String?
      ..order = (json['order'] as num?)?.toInt()
      ..visible = (json['visible'] as num?)?.toInt();

Map<String, dynamic> _$HotSearchItemToJson(HotSearchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
