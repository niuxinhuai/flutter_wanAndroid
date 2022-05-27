import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/knowledge/knowledge.dart';
import 'package:flutter_wanandroid/sections/home/page/knowledge/state.dart';

class CellConnector extends ConnOp<KnowledgeState, KnowledgeStage> {
  final int index;
  CellConnector({this.index = 0});

  @override
  KnowledgeStage? get(KnowledgeState? state) {
    if (index > state!.wrap!.data!.length) return null;
    return state.wrap!.data![index];
  }
}
