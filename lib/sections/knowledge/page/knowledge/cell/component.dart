import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/knowledge/models/knowledge/knowledge.dart';

import 'view.dart';

class KnowledgeCellComponent extends Component<KnowledgeStage> {
  KnowledgeCellComponent()
      : super(
          view: buildView,
        );
}
