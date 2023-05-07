import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/get_icons.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/lottie_files.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

import '../TextWidgets/bold_text.dart';

class NotAvailableView extends StatelessWidget {
  final String? header,text,icon;
  final double? marginTop;
  const NotAvailableView({this.marginTop,this.icon,required this.header,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DividerVertical(marginTop??0),
          Lottie.asset(icon??LottieString.restInPeace,
              height: ScreenSize().heightOnly(30),width: ScreenSize().heightOnly(30),repeat: true),
          const DividerVertical(4),
          BoldText(
            header??'',
            textAlign: TextAlign.center,
            fontSize: GetDimens.mediumTextHeight,
          ),
          const DividerVertical(1.5),
          RegularText(
            text??'',
            textAlign: TextAlign.center,
          ),
          const DividerVertical(6),
        ],
      ),
    );
  }
}
