import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:flutter_wanandroid/sections/home/page/home/state.dart';

class HeaderConnertor extends ConnOp<HomeState, HomeBannerWrap> {
  @override
  HomeBannerWrap? get(HomeState? state) {
    return state?.bannerWrap;
  }

  @override
  void set(HomeState state, HomeBannerWrap subState) {
    state.bannerWrap = subState;
  }
}
