// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeArticleWrap _$KnowledgeArticleWrapFromJson(
        Map<String, dynamic> json) =>
    KnowledgeArticleWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => KnowledgeStage.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$KnowledgeArticleWrapToJson(
        KnowledgeArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

KnowledgeStage _$KnowledgeStageFromJson(Map<String, dynamic> json) =>
    KnowledgeStage()
      ..visible = (json['visible'] as num?)?.toInt()
      ..userControlSetTop = json['userControlSetTop'] as bool?
      ..parentChapterId = (json['parentChapterId'] as num?)?.toInt()
      ..order = (json['order'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..lisenseLink = json['lisenseLink'] as String?
      ..lisense = json['lisense'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..desc = json['desc'] as String?
      ..cover = json['cover'] as String?
      ..courseId = (json['courseId'] as num?)?.toInt()
      ..author = json['author'] as String?
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => KnowledgeChildItem.fromJson(e as Map<String, dynamic>))
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

KnowledgeChildItem _$KnowledgeChildItemFromJson(Map<String, dynamic> json) =>
    KnowledgeChildItem()
      ..visible = (json['visible'] as num?)?.toInt()
      ..userControlSetTop = json['userControlSetTop'] as bool?
      ..parentChapterId = (json['parentChapterId'] as num?)?.toInt()
      ..order = (json['order'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..lisenseLink = json['lisenseLink'] as String?
      ..lisense = json['lisense'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..desc = json['desc'] as String?
      ..cover = json['cover'] as String?
      ..courseId = (json['courseId'] as num?)?.toInt()
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
