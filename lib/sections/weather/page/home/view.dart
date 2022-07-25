import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/helper/router.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/page/weather/page.dart';
import 'package:flutter_wanandroid/widget/effect.dart';
import 'package:flutter_wanandroid/widget/segment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WeatherSegmentState state, Dispatch dispatch, ViewService viewService) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: new ExactAssetImage('assets/images/weather_bg.jpg'),
          fit: BoxFit.fill,
        )),
      ),
      if (state.list!.length != 0 && state.pageController != null)
        _buildBody(state, dispatch, viewService)
    ],
  );
}

Widget _buildBody(
    WeatherSegmentState state, Dispatch dispatch, ViewService viewService) {
  String key = "";
  state.list!.forEach((element) {
    key = key + element.id!;
  });
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: PageView.builder(
          key: ValueKey(key),
          controller: state.pageController,
          itemCount: state.list!.length,
          onPageChanged: (int page) =>
              dispatch(WeatherSegmentActionCreator.onPageChangedAction(page)),
          itemBuilder: (BuildContext context, int index) {
            CityPlace place = state.list![index];
            Map<String, dynamic> map = {};
            map = place.toJson();
            map.remove("location");
            map.putIfAbsent("location", () => place.location!.toJson());
            return KeepAliveWidget(
              childWidget: WeatherPage().buildPage({"place": map}),
            );
          },
        ),
      ),
      _buildBottom(state, dispatch, viewService)
    ],
  );
}

Widget _buildBottom(
    WeatherSegmentState state, Dispatch dispatch, ViewService viewService) {
  return EffectWidget(
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(color: Color(0xFF4088B9)),
    padding: EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            ARouter.close(viewService.context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.list!
                .map((e) => _buildPoint(
                    state, dispatch, viewService, state.list!.indexOf(e)))
                .toList(),
          ),
        )),
        GestureDetector(
          onTap: () =>
              dispatch(WeatherSegmentActionCreator.onTapAddPlaceAction()),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget _buildPoint(WeatherSegmentState state, Dispatch dispatch,
    ViewService viewService, int index) {
  bool selected = state.page == index;

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => dispatch(WeatherSegmentActionCreator.onTapPointAction(index)),
    child: Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: selected
              ? CommonColors.onPrimaryTextColor
              : CommonColors.textColorDDD,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    ),
  );
}
