import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'action.dart';
import 'state.dart';

Effect<KnowledgeState>? buildEffect() {
  return combineEffects(<Object, Effect<KnowledgeState>>{
    KnowledgeAction.action: _onAction,
    Lifecycle.initState: _initState,
    KnowledgeAction.onTapCell: _onTapCell,
  });
}

void _initState(Action action, Context<KnowledgeState> ctx) async {
  KnowledgeArticleWrap? wrap = await CommonService.getKnowledge();
  ctx.dispatch(KnowledgeActionCreator.didFetchAction(wrap));
}

void _onTapCell(Action action, Context<KnowledgeState> ctx) {
  final KnowledgeStage stage = action.payload;
  Map<String, dynamic> map = stage.toJson();
  List<KnowledgeChildItem> items = map["children"];
  List itemList = [];
  for (KnowledgeChildItem item in items) {
    itemList.add(item.toJson());
  }
  map["children"] = itemList;
  ARouter.open(ctx.context, RouterKeys.knowledge_article, params: map);
}

void _onAction(Action action, Context<KnowledgeState> ctx) {}
