import 'package:fish_redux/fish_redux.dart';

enum SearchResultAction { action, onClickBack }

class SearchResultActionCreator {
  static Action onAction() {
    return const Action(SearchResultAction.action);
  }

  static Action onClickBackAction() {
    return const Action(SearchResultAction.onClickBack);
  }
}
