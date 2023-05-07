import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

import '../../src/lottie_files.dart';

class DefaultCircularProgress extends StatelessWidget {
  final int? color;
  final double? size;
  const DefaultCircularProgress({this.color,this.size,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Lottie.asset(LottieString.loaderAnim,
            fit: BoxFit.fitWidth,height: ScreenSize().heightOnly(size??30),width: ScreenSize().heightOnly(size??30),repeat: true)
    );
  }
}
