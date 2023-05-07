import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

class GetFont
{
  static dynamic get(BuildContext context,{double? fontSize,FontWeight? fontWeight,int? color,int? extraColor,double? height,double? letterSpacing,TextDecoration? textDecoration})
  {
    return GoogleFonts.poppins(
        height: height,
        fontSize: ScreenSize().heightOnly(fontSize??1.4),
        fontWeight: fontWeight,
        decoration: textDecoration,
        letterSpacing:letterSpacing,
        color: Color(extraColor??color??MyColor.colorBlack)
    );
  }
}