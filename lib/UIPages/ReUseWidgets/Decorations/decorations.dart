import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/shadows.dart';
import 'package:recipley_assignment/src/colors.dart';

class GetDecoration
{
  static getDecoration({int? color,double? elevation,bool? otherShadow,double? radius,bool? noShadow})
  {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radius??15)),
        color: Color(color??MyColor.colorWhite),
        boxShadow: noShadow==true?null:otherShadow==true?GetShadows.getShadowForLongBox(elevation: elevation,):GetShadows.getShadow(elevation: elevation)
    );
  }
}