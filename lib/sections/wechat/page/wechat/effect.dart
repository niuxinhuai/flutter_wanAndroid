import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'action.dart';
import 'state.dart';

Effect<WeChatArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<WeChatArticleState>>{
    WeChatArticleAction.action: _onAction,
    Lifecycle.initState: _initState,
    WeChatArticleAction.onTapSearch: _onTapSearch,
  });
}

void _initState(Action action, Context<WeChatArticleState> ctx) async {
  List<KnowledgeChildItem> beans = await CommonService.getWxArticle();
  ctx.dispatch(WeChatArticleActionCreator.didFeatchDataAction(beans));
}

///搜索
void _onTapSearch(Action action, Context<WeChatArticleState> ctx) {
  ARouter.open(ctx.context, RouterKeys.search);
}

void _onAction(Action action, Context<WeChatArticleState> ctx) {}
