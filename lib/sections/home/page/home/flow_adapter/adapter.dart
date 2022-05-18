import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/page/home/cell/component.dart';
import 'package:flutter_wanandroid/sections/home/page/home/flow_adapter/cell_connector.dart';
import 'package:flutter_wanandroid/sections/home/page/home/flow_adapter/header_connector.dart';
import 'package:flutter_wanandroid/sections/home/page/home/header/component.dart';
import 'package:flutter_wanandroid/sections/home/page/home/state.dart';

FlowAdapter<HomeState> get adapter => FlowAdapter<HomeState>(
    view: (HomeState state) => DependentArray(
        builder: (int index) {
          if (index == 0) {
            return HeaderConnertor() + HomeHeaderComponent();
          }
          return CellConnector(index: index) + HomeCellComponent();
        },
        length: state.beans!.length));
