import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/sections/home/models/banner/banner.dart';
import 'package:flutter_wanandroid/sections/home/page/home/action.dart';

Widget buildView(
    HomeBannerWrap state, Dispatch dispatch, ViewService viewService) {
  double screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
  if (state.data != null && state.data!.length != 0) {
    return SizedBox(
      width: screenWidth,
      height: screenWidth * 500 / 900,
      child: Swiper(
        autoplay: true,
        loop: true,
        index: 0,
        itemCount: state.data!.length,
//        viewportFraction: 1.0, //0.85,
        scale: 1.0,
        onTap: (int index) =>
            dispatch(HomeActionCreator.onTapBannerAction(state.data![index])),
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: state.data![index].imagePath ?? "",
            fadeInDuration: Duration(milliseconds: 0),
            fadeOutDuration: Duration(milliseconds: 0),
          );
        },
      ),
    );
  }
  return Container(
    width: 0,
    height: 0,
  );
}
