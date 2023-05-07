import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';

class RegularText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final int color;
  final int? maxLine;
  final double? height;
  final double? letterSpacing;
  final TextAlign? textAlign;

  const RegularText(
      this.text,
      {
        this.fontSize = GetDimens.regularTextHeight,
        this.height,
        this.maxLine,
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
      maxLines: maxLine,
      style: GetFont.get(
          context,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          color: color,
          letterSpacing: letterSpacing??0.4,
          height: height
      ),
      textAlign: textAlign,
    );
  }
}
