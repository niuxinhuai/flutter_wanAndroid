import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_wanandroid/repository/services/common_service.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/other_theme.dart';
import 'package:flutter_wanandroid/sections/weather/models/place.dart';
import 'package:flutter_wanandroid/sections/weather/models/weather.dart';
import 'package:flutter_wanandroid/utils/weather_util.dart';
import 'package:flutter_wanandroid/widget/toast.dart';
import 'package:reorderables/reorderables.dart';

class WeatherPlaceWidget extends StatefulWidget {
  ///新增place时回掉
  final Function(CityPlace)? callback;

  ///删除某个数据源的操作回掉
  final Function(String)? deleteCallback;

  ///切换顺序的操作回掉
  final Function(int, int)? onReorderCallback;
  final double? width;

  ///weather数据源
  final List<CityPlace>? list;

  WeatherPlaceWidget(
      {this.callback,
      this.width,
      this.list,
      this.deleteCallback,
      this.onReorderCallback});

  @override
  _WeatherPlaceWidgetState createState() => _WeatherPlaceWidgetState();
}

class _WeatherPlaceWidgetState extends State<WeatherPlaceWidget> {
  final TextEditingController textEditingController = TextEditingController();
  PlaceStage? placeStage;
  List<Widget> _rows = [];
  String? text;
  List<PlaceChildItem> items = [];
  String temperatureStr = "℃";

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() {
      text = textEditingController.text;
      if (text == null || text?.isEmpty == true) {
        if (mounted) {
          setState(() {
            placeStage = null;
          });
        }
      }
    });

    _getWeatherData();
  }

  ///获取已经存在的天气的数据源
  void _getWeatherData() async {
    items.clear();
    if (widget.list != null && widget.list?.length != 0) {
      for (int i = 0; i < widget.list!.length; ++i) {
        CityPlace cityPlace = widget.list![i];
        PlaceChildItem item = await _getChildItemData(cityPlace);
        items.add(item);
      }
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<PlaceChildItem> _getChildItemData(CityPlace cityPlace) async {
    double lat = cityPlace.location!.lat!;
    double lng = cityPlace.location!.lng!;
    PlaceChildItem placeChildItem = PlaceChildItem();
    placeChildItem.id = cityPlace.id;
    placeChildItem.name = cityPlace.name;

    ///综合天气
    WeatherStage stage = await CommonService.getWeather(lat, lng);
    if (stage.result != null) {
      WeatherResult result = stage.result!;

      if (result.realtime != null) {
        placeChildItem.skycon =
            '${WeatherUtil.getWeatherSkyicon(result.realtime?.skycon ?? "")}';
        placeChildItem.temperature =
            "${(result.realtime?.temperature ?? 0).toInt()}${temperatureStr}";
      }

      if (result.daily?.temperature != null &&
          result.daily?.temperature!.length != 0) {
        List<DailyItem> temperature = result.daily!.temperature!;

        ///dailyItem
        DailyItem dailyItem = temperature.first;
        placeChildItem.max = "最高${dailyItem.max?.round()}${temperatureStr}";
        placeChildItem.min = "最低${dailyItem.min?.round()}${temperatureStr}";
      }
    }

    return placeChildItem;
  }

  ///根据query获取指定位置天气信息
  void _getWeatherPlaceStage(String? query) async {
    if (query == null || query.isEmpty == true) {
      Toast.toast(context, "输入有误");
      return;
    }
    placeStage = await CommonService.getWeatherPlace(query);
    if (placeStage != null) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
//          color: CommonColors.foregroundColor,
          color: Color(0xFF4088B9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextfield(context),
          if ((text == null || text?.isEmpty == true) && items.length != 0)
            Expanded(child: _buildReorderables()),
          if (placeStage?.places != null && placeStage?.places?.length != 0)
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    CityPlace place = placeStage!.places![index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (widget.callback != null) {
                          widget.callback!(place);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(place.name ?? "",
                                style: GpOtherTheme.size19(context)!.copyWith(
                                    color: CommonColors.onPrimaryTextColor)),
                            Text(
                              place.formatted_address ?? "",
                              maxLines: 5,
                              style: GpOtherTheme.size15Grey(context)
                                  .copyWith(color: CommonColors.textColorDDD),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 15),
                      color: CommonColors.divider,
                      height: 0.5,
                      width: double.infinity,
                    );
                  },
                  itemCount: placeStage!.places!.length),
            )
        ],
      ),
    );
  }

  Widget _buildTextfield(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
          style: GpOtherTheme.size17(context)!
              .copyWith(color: CommonColors.onPrimaryTextColor),
          controller: textEditingController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.streetAddress,
          onSubmitted: (String text) => _getWeatherPlaceStage(text),
          decoration: InputDecoration(
              labelText: '搜索城市或机场',
              labelStyle: GpOtherTheme.size14(context)
                  .copyWith(color: CommonColors.textColorDDD),
              contentPadding: EdgeInsets.all(8))),
    );
  }

  Widget _buildReorderables() {
    _rows = items.map((e) => _buildChildItem(e)).toList();
    void _onReorder(int oldIndex, int newIndex) {
      if (mounted) {
        if (widget.onReorderCallback != null) {
          widget.onReorderCallback!(oldIndex, newIndex);
        }
        setState(() {
          Widget row = _rows.removeAt(oldIndex);
          _rows.insert(newIndex, row);
          PlaceChildItem childItem = items.removeAt(oldIndex);
          items.insert(newIndex, childItem);
        });
      }
    }

    return ReorderableColumn(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _rows,
      onReorder: _onReorder,
      buildDraggableFeedback:
          (BuildContext context, BoxConstraints constraints, Widget child) {
        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
    );
  }

  Widget _buildChildItem(PlaceChildItem childItem) {
    //滑动组件
    return Padding(
      key: ValueKey(childItem.id),
      padding: EdgeInsets.only(bottom: 15),
      child: Slidable(
        key: ValueKey(childItem.id),
        direction: Axis.horizontal,
        enabled: items.length <= 1 ? false : true,
        endActionPane:
            ActionPane(motion: ScrollMotion(), extentRatio: 0.5, children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            label: "",
            backgroundColor: Colors.transparent,
          ),
          SlidableAction(
            flex: 5,
            onPressed: (BuildContext context) {
              _deleteItem(childItem);
            },
            icon: Icons.delete,
            label: "删除",
            borderRadius: BorderRadius.all(Radius.circular(12)),
            backgroundColor: Colors.orange,
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            label: "",
            backgroundColor: Colors.transparent,
          ),
        ]),
        child: Container(
          height: 130,
          width: widget.width! - 30,
//        color: Colors.amber,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: new ExactAssetImage(
                  'assets/images/weather_bg.jpg',
                ), //
                fit: BoxFit.fitWidth,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    childItem.name ?? "",
                    style: GpOtherTheme.size20Green(context)!.copyWith(
                        color: CommonColors.onPrimaryTextColor, fontSize: 27),
                  ),
                  Text(childItem.temperature ?? "",
                      style: GpOtherTheme.size20Green(context)!.copyWith(
                          color: CommonColors.onPrimaryTextColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w300)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    childItem.skycon ?? "",
                    style: GpOtherTheme.size14(context).copyWith(
                        color: CommonColors.onPrimaryTextColor, fontSize: 16),
                  ),
                  Text("${childItem.max ?? ""} ${childItem.min ?? ""}",
                      style: GpOtherTheme.size14(context).copyWith(
                          color: CommonColors.onPrimaryTextColor,
                          fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteItem(PlaceChildItem childItem) {
    if (items.length == 1) {
      Toast.toast(context, "最少保留一个");
      return;
    }
    if (mounted) {
      if (widget.deleteCallback != null) {
        widget.deleteCallback!(childItem.id!);
      }
      int index = items.indexOf(childItem);
      setState(() {
        _rows.removeAt(index);
        items.remove(childItem);
      });
    }
  }
}
