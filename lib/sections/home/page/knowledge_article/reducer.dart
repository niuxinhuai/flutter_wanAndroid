import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<KnowledgeArticleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<KnowledgeArticleState>>{
      KnowledgeArticleAction.action: _onAction,
    },
  );
}

KnowledgeArticleState _onAction(KnowledgeArticleState state, Action action) {
  final KnowledgeArticleState newState = state.clone();
  return newState;
}
