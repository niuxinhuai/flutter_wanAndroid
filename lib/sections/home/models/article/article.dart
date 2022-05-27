import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class HomeArticleWrap extends CommonModel<HomeArticleListData> {
  HomeArticleWrap();

  factory HomeArticleWrap.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleWrapFromJson(json);

  toJson() => _$HomeArticleWrapToJson(this);
}

@JsonSerializable()
class HomeArticleListData {
  HomeArticleListData();

  int? curPage;
  @JsonKey(name: "datas")
  List<HomeArticleBean>? articleList;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  factory HomeArticleListData.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleListDataFromJson(json);

  toJson() => _$HomeArticleListDataToJson(this);
}

@JsonSerializable()
class HomeArticleBean {
  HomeArticleBean();

  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  //是否是新发布的文章
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<ArticleTagBean>? tags;
  String? title;
  //1代表置顶，
  int? type;
  int? userId;
  int? visible;
  int? zan;

  factory HomeArticleBean.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleBeanFromJson(json);

  toJson() => _$HomeArticleBeanToJson(this);
}

@JsonSerializable()
class ArticleTagBean {
  ArticleTagBean();

  String? name;
  String? url;

  factory ArticleTagBean.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagBeanFromJson(json);

  toJson() => _$ArticleTagBeanToJson(this);
}
