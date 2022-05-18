import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class HomeBannerWrap extends CommonModel<List<HomeBannerBean>> {
  HomeBannerWrap();

  factory HomeBannerWrap.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerWrapFromJson(json);

  toJson() => _$HomeBannerWrapToJson(this);
}

@JsonSerializable()
class HomeBannerBean {
  HomeBannerBean();

  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  factory HomeBannerBean.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerBeanFromJson(json);

  toJson() => _$HomeBannerBeanToJson(this);
}
