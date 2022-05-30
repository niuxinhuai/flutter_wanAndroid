import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

class KnowledgeState extends ItemListLike implements Cloneable<KnowledgeState> {
  KnowledgeArticleWrap? wrap;

  @override
  KnowledgeState clone() {
    return KnowledgeState()..wrap = wrap;
  }

  @override
  Object getItemData(int index) {
    if (wrap?.data == null) return "";
    return wrap!.data![index];
  }

  @override
  String getItemType(int index) {
    return "cell";
  }

  @override
  int get itemCount => wrap?.data?.length ?? 0;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    wrap!.data![index] = data as KnowledgeStage;
    return this;
  }
}

KnowledgeState initState(Map<String, dynamic>? args) {
  return KnowledgeState();
}
