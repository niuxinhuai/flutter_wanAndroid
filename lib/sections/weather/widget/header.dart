import 'package:flutter/material.dart';

class WeatherItemHeaderWidget extends StatelessWidget {
  final Icon? icon;
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  WeatherItemHeaderWidget(
      {this.icon, this.text, this.width, this.height, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
//      height: height ?? 30.0,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          if (icon != null) icon!,
          if (text != null)
            Text(
              text!,
              maxLines: 5,
              style: textStyle ?? TextStyle(color: Colors.lightBlueAccent),
            )
        ],
      ),
    );
  }
}
