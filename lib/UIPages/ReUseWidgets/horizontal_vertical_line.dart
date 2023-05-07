import 'package:flutter/material.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class HorizontalLine extends StatelessWidget {
  final int? color;
  final double? width;
  final double? margin;
  const HorizontalLine({this.color,this.width,this.margin,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().heightOnly(0.1),
      margin: EdgeInsets.symmetric(vertical: ScreenSize().heightOnly(margin??2)),
      width: width??double.infinity,
      color: Color(color??MyColor.colorGrey),
    );
  }
}
