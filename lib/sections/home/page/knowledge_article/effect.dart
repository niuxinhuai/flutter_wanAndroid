import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'action.dart';
import 'state.dart';

Effect<KnowledgeArticleState>? buildEffect() {
  return combineEffects(<Object, Effect<KnowledgeArticleState>>{
    KnowledgeArticleAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<KnowledgeArticleState> ctx) {
  final Object tickerProvider = ctx.stfState!;
  ctx.state.tabController = P.TabController(
      initialIndex: ctx.state.curIndex,
      length: ctx.state.stage.children!.length,
      vsync: tickerProvider as P.TickerProvider);
}

void _onAction(Action action, Context<KnowledgeArticleState> ctx) {}
