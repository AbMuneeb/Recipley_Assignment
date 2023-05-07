import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';

class BoldText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final int color;
  final int? extraColor;
  final int? maxLine;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;

  const BoldText(
      this.text,
      {
        this.fontSize = GetDimens.bigTextHeight,
        this.height,
        this.maxLine,
        this.extraColor,
        this.letterSpacing,
        this.textAlign,
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
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
          color: color,
          extraColor: extraColor,
          letterSpacing: letterSpacing,
          height: height
      ),
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}
