// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationArticleWrap _$NavigationArticleWrapFromJson(
        Map<String, dynamic> json) =>
    NavigationArticleWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => NavigationStage.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NavigationArticleWrapToJson(
        NavigationArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

NavigationStage _$NavigationStageFromJson(Map<String, dynamic> json) =>
    NavigationStage()
      ..cid = (json['cid'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..articles = (json['articles'] as List<dynamic>?)
          ?.map((e) => HomeArticleBean.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NavigationStageToJson(NavigationStage instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'articles': instance.articles,
    };
