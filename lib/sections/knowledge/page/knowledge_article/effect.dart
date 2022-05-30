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

void _initState(Action action, Context<KnowledgeArticleState> ctx) {}

void _onAction(Action action, Context<KnowledgeArticleState> ctx) {}
