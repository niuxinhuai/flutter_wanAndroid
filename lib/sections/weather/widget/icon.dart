import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String? aseetIconName;

  WeatherIcon({this.aseetIconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Image.asset("assets/images/pic/$aseetIconName"),
    );
  }
}
