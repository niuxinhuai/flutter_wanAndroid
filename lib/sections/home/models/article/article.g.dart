// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticleWrap _$HomeArticleWrapFromJson(Map json) => HomeArticleWrap()
  ..errorMsg = json['errorMsg'] as String?
  ..errorCode = json['errorCode'] as int?
  ..data = json['data'] == null
      ? null
      : HomeArticleListData.fromJson(
          Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$HomeArticleWrapToJson(HomeArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HomeArticleListData _$HomeArticleListDataFromJson(Map json) =>
    HomeArticleListData()
      ..curPage = json['curPage'] as int?
      ..articleList = (json['datas'] as List<dynamic>?)
          ?.map((e) =>
              HomeArticleBean.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList()
      ..offset = json['offset'] as int?
      ..over = json['over'] as bool?
      ..pageCount = json['pageCount'] as int?
      ..size = json['size'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$HomeArticleListDataToJson(
        HomeArticleListData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.articleList,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

HomeArticleBean _$HomeArticleBeanFromJson(Map json) => HomeArticleBean()
  ..apkLink = json['apkLink'] as String?
  ..audit = json['audit'] as int?
  ..author = json['author'] as String?
  ..canEdit = json['canEdit'] as bool?
  ..chapterId = json['chapterId'] as int?
  ..chapterName = json['chapterName'] as String?
  ..collect = json['collect'] as bool?
  ..courseId = json['courseId'] as int?
  ..desc = json['desc'] as String?
  ..descMd = json['descMd'] as String?
  ..envelopePic = json['envelopePic'] as String?
  ..fresh = json['fresh'] as bool?
  ..host = json['host'] as String?
  ..id = json['id'] as int?
  ..link = json['link'] as String?
  ..niceDate = json['niceDate'] as String?
  ..niceShareDate = json['niceShareDate'] as String?
  ..origin = json['origin'] as String?
  ..prefix = json['prefix'] as String?
  ..projectLink = json['projectLink'] as String?
  ..publishTime = json['publishTime'] as int?
  ..realSuperChapterId = json['realSuperChapterId'] as int?
  ..selfVisible = json['selfVisible'] as int?
  ..shareDate = json['shareDate'] as int?
  ..shareUser = json['shareUser'] as String?
  ..superChapterId = json['superChapterId'] as int?
  ..superChapterName = json['superChapterName'] as String?
  ..tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => ArticleTagBean.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..title = json['title'] as String?
  ..type = json['type'] as int?
  ..userId = json['userId'] as int?
  ..visible = json['visible'] as int?
  ..zan = json['zan'] as int?;

Map<String, dynamic> _$HomeArticleBeanToJson(HomeArticleBean instance) =>
    <String, dynamic>{
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'host': instance.host,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'realSuperChapterId': instance.realSuperChapterId,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };

ArticleTagBean _$ArticleTagBeanFromJson(Map json) => ArticleTagBean()
  ..name = json['name'] as String?
  ..url = json['url'] as String?;

Map<String, dynamic> _$ArticleTagBeanToJson(ArticleTagBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
