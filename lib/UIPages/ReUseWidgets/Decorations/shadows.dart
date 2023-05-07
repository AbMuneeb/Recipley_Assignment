import 'package:flutter/material.dart';
import 'package:recipley_assignment/src/colors.dart';

class GetShadows
{
  static const double _elevation = 10;

  static getShadow({double? elevation}){
    return [
      BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 0.0,
          blurRadius: (elevation??_elevation),
          offset: const Offset(3.0, 3.0)),
      BoxShadow(
          color: const Color(MyColor.colorPrimary).withOpacity(0.3),
          spreadRadius: 0.0,
          blurRadius: (elevation??_elevation) / 2.0,
          offset: const Offset(3.0, 3.0)),
      BoxShadow(
          color: const Color(MyColor.colorPrimary).withOpacity(0.2),
          spreadRadius: 0.0,
          blurRadius: (elevation??_elevation) / 2.0,
          offset: const Offset(-4.0, 4.0)),
      BoxShadow(
          color: Colors.white,
          spreadRadius: 2.0,
          blurRadius: (elevation??_elevation),
          offset: const Offset(-3.0, -3.0)),
      BoxShadow(
          color: Colors.white,
          spreadRadius: 2.0,
          blurRadius: (elevation??_elevation) / 2,
          offset: const Offset(-3.0, -3.0)),
    ];
  }
  static getShadowForLongBox({double? elevation}){
    return [

      // BoxShadow(
      //     color: const Color(MyColor.colorPrimary).withOpacity(0.1),
      //     spreadRadius: 3,
      //     blurRadius: (elevation??_elevation) / 2.0,
      //     offset: const Offset(0, 4.0)),
      BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 0.0,
          blurRadius: 20,
          offset: Offset(3.0, 3.0)),
      BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 0.0,
          blurRadius: 20 / 2.0,
          offset: Offset(3.0, 3.0)),
      BoxShadow(
          color: Colors.grey.shade100,
          spreadRadius: 2.0,
          blurRadius: 20,
          offset: Offset(-3.0, -3.0)),
      // BoxShadow(
      //     color: Colors.grey.shade100,
      //     spreadRadius: 2.0,
      //     blurRadius: 20,
      //     offset: Offset(-6.0, -6.0)),

      BoxShadow(
          color: Colors.white,
          spreadRadius: 2.0,
          blurRadius: 20 / 2,
          offset: Offset(-3.0, -3.0)),
      // BoxShadow(
      //     color: Colors.grey.shade100,
      //     spreadRadius: 0.0,
      //     blurRadius: 20 / 2.0,
      //     offset: Offset(3.0, -3.0)),

    ];
  }
}