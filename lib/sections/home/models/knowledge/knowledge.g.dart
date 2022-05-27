// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeArticleWrap _$KnowledgeArticleWrapFromJson(Map json) =>
    KnowledgeArticleWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = json['errorCode'] as int?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              KnowledgeStage.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$KnowledgeArticleWrapToJson(
        KnowledgeArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

KnowledgeStage _$KnowledgeStageFromJson(Map json) => KnowledgeStage()
  ..visible = json['visible'] as int?
  ..userControlSetTop = json['userControlSetTop'] as bool?
  ..parentChapterId = json['parentChapterId'] as int?
  ..order = json['order'] as int?
  ..name = json['name'] as String?
  ..lisenseLink = json['lisenseLink'] as String?
  ..lisense = json['lisense'] as String?
  ..id = json['id'] as int?
  ..desc = json['desc'] as String?
  ..cover = json['cover'] as String?
  ..courseId = json['courseId'] as int?
  ..author = json['author'] as String?
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) =>
          KnowledgeChildItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$KnowledgeStageToJson(KnowledgeStage instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'userControlSetTop': instance.userControlSetTop,
      'parentChapterId': instance.parentChapterId,
      'order': instance.order,
      'name': instance.name,
      'lisenseLink': instance.lisenseLink,
      'lisense': instance.lisense,
      'id': instance.id,
      'desc': instance.desc,
      'cover': instance.cover,
      'courseId': instance.courseId,
      'author': instance.author,
      'children': instance.children,
    };

KnowledgeChildItem _$KnowledgeChildItemFromJson(Map json) =>
    KnowledgeChildItem()
      ..visible = json['visible'] as int?
      ..userControlSetTop = json['userControlSetTop'] as bool?
      ..parentChapterId = json['parentChapterId'] as int?
      ..order = json['order'] as int?
      ..name = json['name'] as String?
      ..lisenseLink = json['lisenseLink'] as String?
      ..lisense = json['lisense'] as String?
      ..id = json['id'] as int?
      ..desc = json['desc'] as String?
      ..cover = json['cover'] as String?
      ..courseId = json['courseId'] as int?
      ..author = json['author'] as String?;

Map<String, dynamic> _$KnowledgeChildItemToJson(KnowledgeChildItem instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'userControlSetTop': instance.userControlSetTop,
      'parentChapterId': instance.parentChapterId,
      'order': instance.order,
      'name': instance.name,
      'lisenseLink': instance.lisenseLink,
      'lisense': instance.lisense,
      'id': instance.id,
      'desc': instance.desc,
      'cover': instance.cover,
      'courseId': instance.courseId,
      'author': instance.author,
    };
