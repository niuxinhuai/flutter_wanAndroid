import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'action.dart';
import 'state.dart';

Effect<ProjectArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<ProjectArticleState>>{
    ProjectArticleAction.action: _onAction,
    Lifecycle.initState: _initState,
    ProjectArticleAction.onTapSearch: _onTapSearch,
  });
}

void _initState(Action action, Context<ProjectArticleState> ctx) async {
  List<KnowledgeChildItem> items = await CommonService.getProgectArticle();
  ctx.dispatch(ProjectArticleActionCreator.didFeatchDataAction(items));
}

///搜索
void _onTapSearch(Action action, Context<ProjectArticleState> ctx) {
  ARouter.open(ctx.context, RouterKeys.search);
}

void _onAction(Action action, Context<ProjectArticleState> ctx) {}
