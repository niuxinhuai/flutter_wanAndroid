import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/article/article.dart';
import 'package:flutter_wanandroid/sections/home/widget/article_item.dart';
import 'package:flutter_wanandroid/widget/appbar.dart';
import 'package:flutter_wanandroid/widget/loading_wrap.dart';
import 'package:flutter_wanandroid/widget/refresh_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FavoriteArticleState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      title: Text('我的收藏'),
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
    ),
  );
}

Widget _buildBody(
    FavoriteArticleState state, Dispatch dispatch, ViewService viewService) {
  if (state.beans.length == 0) {
    return Container(
      alignment: Alignment.center,
      child: Text("${state.loadNoMoreData! ? '快去收藏文章吧~~' : "上啦加载更多哟~"}"),
    );
  }
  return CustomRefreshIndicator(
    controller: state.refreshController,
    enablePullUp: state.loadNoMoreData! ? false : true,
    onLoading: () => dispatch(FavoriteArticleActionCreator.onLoadingAction()),
    child: ListView.builder(
      padding: EdgeInsets.only(bottom: 30),
      itemCount: state.beans.length,
      itemBuilder: (BuildContext context, int index) {
        HomeArticleBean bean = state.beans[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () =>
              dispatch(FavoriteArticleActionCreator.onTapCellAction(bean)),
          child: ArticleItemWidget(
            isFromCollect: true,
            articleBean: bean,
            callBack: (int id) => dispatch(
                FavoriteArticleActionCreator.onTapUnCollectCellAction(id)),
          ),
        );
      },
    ),
  );
}
