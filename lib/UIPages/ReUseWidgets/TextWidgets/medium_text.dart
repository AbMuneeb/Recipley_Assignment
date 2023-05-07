import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';

class MediumText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final int color;
  final int? extraColor;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;

  const MediumText(
      this.text,
      {
        this.fontSize = GetDimens.mediumTextHeight,
        this.height,
        this.extraColor,
        this.textAlign,
        this.letterSpacing,
        this.color = MyColor.colorBlack,
        Key? key
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: GetFont.get(
          context,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          color: color,
          extraColor: extraColor,
          letterSpacing: letterSpacing,
          height: height
      ),
      textAlign: textAlign,
    );
  }
}
