import 'package:flutter_wanandroid/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hot_search.g.dart';

@JsonSerializable()
class SearchWrap extends CommonModel<List<HotSearchItem>> {
  SearchWrap();

  factory SearchWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchWrapFromJson(json);

  toJson() => _$SearchWrapToJson(this);
}

@JsonSerializable()
class HotSearchItem {
  HotSearchItem();
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  factory HotSearchItem.fromJson(Map<String, dynamic> json) =>
      _$HotSearchItemFromJson(json);

  toJson() => _$HotSearchItemToJson(this);
}
