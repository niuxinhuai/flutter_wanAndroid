import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';
import 'action.dart';
import 'state.dart';

Effect<KnowledgeArticleSegmentState>? buildEffect() {
  return combineEffects(<Object, Effect<KnowledgeArticleSegmentState>>{
    KnowledgeArticleSegmentAction.action: _onAction,
    Lifecycle.initState: _initState,
    KnowledgeArticleSegmentAction.onLoading: _onLoading,
    KnowledgeArticleSegmentAction.onTapArticle: _onTapArticle,
  });
}

void _initState(
    Action action, Context<KnowledgeArticleSegmentState> ctx) async {
  List<HomeArticleBean> items = ctx.state.type == ArticlePageType.knowledge
      ? await CommonService.getKnowledgeUserArticle(
          ctx.state.page, ctx.state.cid)
      : await CommonService.getWxUserArticle(ctx.state.page, ctx.state.cid);
  ctx.dispatch(KnowledgeArticleSegmentActionCreator.didFetchDataAction(items));
}

void _onLoading(Action action, Context<KnowledgeArticleSegmentState> ctx) {
  _initState(action, ctx);
}

void _onTapArticle(Action action, Context<KnowledgeArticleSegmentState> ctx) {
  final HomeArticleBean bean = action.payload;
  ARouter.open(ctx.context, RouterKeys.webView,
      params: {"url": bean.link ?? ""});
}

void _onAction(Action action, Context<KnowledgeArticleSegmentState> ctx) {}
