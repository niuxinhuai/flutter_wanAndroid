import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/helper/router_helper.dart';
import 'package:flutter_wanandroid/models/db/db_model.dart';
import 'package:flutter_wanandroid/repository/database/common_database.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/sections/search/models/hot_search.dart';
import 'package:flutter_wanandroid/sections/search/page/search/history_component/action.dart';
import 'package:flutter_wanandroid/utils/time_util.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchArticleState>>{
    SearchArticleAction.action: _onAction,
    SearchArticleAction.onTapClearWords: _onTapClearWords,
    SearchArticleAction.onSubmit: _onSubmit,
    Lifecycle.dispose: _dispose,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SearchArticleState> ctx) async {
  SearchWrap? wrap = await CommonService.getHotSearch();
  ctx.dispatch(SearchArticleActionCreator.didFeatchDataAction(wrap));
}

void _onTapClearWords(Action action, Context<SearchArticleState> ctx) {
  ctx.state.textEditingController?.clear();
}

void _onSubmit(Action action, Context<SearchArticleState> ctx) {
  final String text = action.payload;
  if (text.isNotEmpty) {
    print(">>>>>>>>>>>>搜索结果:$text");
    UserSearchLog log = UserSearchLog();
    log.keyWords = text;
    log.time = TimeUtil.getApartSeconds();
    CommonDb.updateSearchHistoryLog(log);

    ARouter.open(ctx.context, RouterKeys.search_result, params: {
      'keyWords': log.keyWords ?? ""
    }).then(
        (value) => ctx.dispatch(SearchHistoryActionCreator.onRefreshAction()));
  }
}

void _dispose(Action action, Context<SearchArticleState> ctx) {
  ctx.state.textEditingController?.dispose();
}

void _onAction(Action action, Context<SearchArticleState> ctx) {}
