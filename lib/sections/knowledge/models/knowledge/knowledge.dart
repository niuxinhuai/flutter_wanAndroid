import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'knowledge.g.dart';

@JsonSerializable()
class KnowledgeArticleWrap extends CommonModel<List<KnowledgeStage>> {
  KnowledgeArticleWrap();

  factory KnowledgeArticleWrap.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeArticleWrapFromJson(json);

  toJson() => _$KnowledgeArticleWrapToJson(this);
}

@JsonSerializable()
class KnowledgeStage {
  KnowledgeStage();

  int? visible;
  bool? userControlSetTop;
  int? parentChapterId;
  int? order;
  String? name;
  String? lisenseLink;
  String? lisense;
  int? id;
  String? desc;
  String? cover;
  int? courseId;
  String? author;
  List<KnowledgeChildItem>? children;

  factory KnowledgeStage.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeStageFromJson(json);

  toJson() => _$KnowledgeStageToJson(this);
}

@JsonSerializable()
class KnowledgeChildItem {
  KnowledgeChildItem();

  int? visible;
  bool? userControlSetTop;
  int? parentChapterId;
  int? order;
  String? name;
  String? lisenseLink;
  String? lisense;
  int? id;
  String? desc;
  String? cover;
  int? courseId;
  String? author;

  factory KnowledgeChildItem.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeChildItemFromJson(json);

  toJson() => _$KnowledgeChildItemToJson(this);
}

enum ArticlePageType { knowledge, wxArticle, project, search }
