// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchWrap _$SearchWrapFromJson(Map json) => SearchWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => HotSearchItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$SearchWrapToJson(SearchWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HotSearchItem _$HotSearchItemFromJson(Map json) => HotSearchItem()
  ..id = json['id'] as int?
  ..link = json['link'] as String?
  ..name = json['name'] as String?
  ..order = json['order'] as int?
  ..visible = json['visible'] as int?;

Map<String, dynamic> _$HotSearchItemToJson(HotSearchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
