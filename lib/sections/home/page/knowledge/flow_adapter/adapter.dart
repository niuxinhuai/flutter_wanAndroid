import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/page/knowledge/cell/component.dart';
import 'package:flutter_wanandroid/sections/home/page/knowledge/flow_adapter/cell_connector.dart';
import 'package:flutter_wanandroid/sections/home/page/knowledge/state.dart';

FlowAdapter<KnowledgeState> get adapter => FlowAdapter<KnowledgeState>(
    view: (KnowledgeState state) => DependentArray(
        builder: (int index) {
          return CellConnector(index: index) + KnowledgeCellComponent();
        },
        length: state.wrap!.data!.length));
