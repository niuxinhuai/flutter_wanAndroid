// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticleWrap _$HomeArticleWrapFromJson(Map<String, dynamic> json) =>
    HomeArticleWrap()
      ..errorMsg = json['errorMsg'] as String?
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..data = json['data'] == null
          ? null
          : HomeArticleListData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$HomeArticleWrapToJson(HomeArticleWrap instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

HomeArticleListData _$HomeArticleListDataFromJson(Map<String, dynamic> json) =>
    HomeArticleListData()
      ..curPage = (json['curPage'] as num?)?.toInt()
      ..articleList = (json['datas'] as List<dynamic>?)
          ?.map((e) => HomeArticleBean.fromJson(e as Map<String, dynamic>))
          .toList()
      ..offset = (json['offset'] as num?)?.toInt()
      ..over = json['over'] as bool?
      ..pageCount = (json['pageCount'] as num?)?.toInt()
      ..size = (json['size'] as num?)?.toInt()
      ..total = (json['total'] as num?)?.toInt();

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

HomeArticleBean _$HomeArticleBeanFromJson(Map<String, dynamic> json) =>
    HomeArticleBean()
      ..apkLink = json['apkLink'] as String?
      ..audit = (json['audit'] as num?)?.toInt()
      ..author = json['author'] as String?
      ..canEdit = json['canEdit'] as bool?
      ..chapterId = (json['chapterId'] as num?)?.toInt()
      ..chapterName = json['chapterName'] as String?
      ..collect = json['collect'] as bool?
      ..courseId = (json['courseId'] as num?)?.toInt()
      ..desc = json['desc'] as String?
      ..descMd = json['descMd'] as String?
      ..envelopePic = json['envelopePic'] as String?
      ..fresh = json['fresh'] as bool?
      ..host = json['host'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..link = json['link'] as String?
      ..niceDate = json['niceDate'] as String?
      ..niceShareDate = json['niceShareDate'] as String?
      ..origin = json['origin'] as String?
      ..originId = (json['originId'] as num?)?.toInt()
      ..prefix = json['prefix'] as String?
      ..projectLink = json['projectLink'] as String?
      ..publishTime = (json['publishTime'] as num?)?.toInt()
      ..realSuperChapterId = (json['realSuperChapterId'] as num?)?.toInt()
      ..selfVisible = (json['selfVisible'] as num?)?.toInt()
      ..shareDate = (json['shareDate'] as num?)?.toInt()
      ..shareUser = json['shareUser'] as String?
      ..superChapterId = (json['superChapterId'] as num?)?.toInt()
      ..superChapterName = json['superChapterName'] as String?
      ..tags = (json['tags'] as List<dynamic>?)
          ?.map((e) => ArticleTagBean.fromJson(e as Map<String, dynamic>))
          .toList()
      ..title = json['title'] as String?
      ..type = (json['type'] as num?)?.toInt()
      ..userId = (json['userId'] as num?)?.toInt()
      ..visible = (json['visible'] as num?)?.toInt()
      ..zan = (json['zan'] as num?)?.toInt();

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
      'originId': instance.originId,
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

ArticleTagBean _$ArticleTagBeanFromJson(Map<String, dynamic> json) =>
    ArticleTagBean()
      ..name = json['name'] as String?
      ..url = json['url'] as String?;

Map<String, dynamic> _$ArticleTagBeanToJson(ArticleTagBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
