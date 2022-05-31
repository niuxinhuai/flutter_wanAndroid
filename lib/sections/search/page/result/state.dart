import 'package:fish_redux/fish_redux.dart';

class SearchResultState implements Cloneable<SearchResultState> {
  String? keyWords;
  int page = 0;

  @override
  SearchResultState clone() {
    return SearchResultState()
      ..keyWords = keyWords
      ..page = page;
  }
}

SearchResultState initState(Map<String, dynamic>? args) {
  return SearchResultState()..keyWords = args!["keyWords"];
}
