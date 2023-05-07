import 'package:flutter/material.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:recipley_assignment/src/strings.dart';

class GetDimens
{
  static const double bigTextHeight = 2.4;
  static const double mediumTextHeight = 2.0;
  static const double regularTextHeight = 1.7;
  static const double padding = 6;
  static const double smallTextHeight = 1.4;
  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(15));
  static double horizontalValuePadding = ScreenSize().widthOnly(5);
  static EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(5));
  static EdgeInsets horizontalPaddingByHeight = EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(2));
  static EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: ScreenSize().heightOnly(2));
  static EdgeInsets allPadding = EdgeInsets.all(ScreenSize().heightOnly(2));
}