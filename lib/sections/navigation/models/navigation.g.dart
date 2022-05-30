// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationArticleWrap _$NavigationArticleWrapFromJson(Map json) =>
    NavigationArticleWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = json['errorCode'] as int?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              NavigationStage.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$NavigationArticleWrapToJson(
        NavigationArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

NavigationStage _$NavigationStageFromJson(Map json) => NavigationStage()
  ..cid = json['cid'] as int?
  ..name = json['name'] as String?
  ..articles = (json['articles'] as List<dynamic>?)
      ?.map(
          (e) => HomeArticleBean.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$NavigationStageToJson(NavigationStage instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'articles': instance.articles,
    };
