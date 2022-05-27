import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/knowledge/knowledge.dart';

import 'action.dart';
import 'state.dart';

Reducer<KnowledgeState>? buildReducer() {
  return asReducer(
    <Object, Reducer<KnowledgeState>>{
      KnowledgeAction.action: _onAction,
      KnowledgeAction.didFetch: _didFetch,
    },
  );
}

KnowledgeState _didFetch(KnowledgeState state, Action action) {
  final KnowledgeArticleWrap? wrap = action.payload;
  final KnowledgeState newState = state.clone();
  newState.wrap = wrap;
  return newState;
}

KnowledgeState _onAction(KnowledgeState state, Action action) {
  final KnowledgeState newState = state.clone();
  return newState;
}
