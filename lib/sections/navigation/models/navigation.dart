import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigation.g.dart';

@JsonSerializable()
class NavigationArticleWrap extends CommonModel<List<NavigationStage>> {
  NavigationArticleWrap();

  factory NavigationArticleWrap.fromJson(Map<String, dynamic> json) =>
      _$NavigationArticleWrapFromJson(json);

  toJson() => _$NavigationArticleWrapToJson(this);
}

@JsonSerializable()
class NavigationStage {
  NavigationStage();
  int? cid;
  String? name;
  List<HomeArticleBean>? articles;

  @JsonKey(ignore: true)
  bool selected = false;

  factory NavigationStage.fromJson(Map<String, dynamic> json) =>
      _$NavigationStageFromJson(json);

  toJson() => _$NavigationStageToJson(this);
}
