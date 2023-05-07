import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class GetIcons extends StatelessWidget {
  final String icon;
  final double size;
  final int iconColor;
  final int? backgroundColor;
  final Function()? onTap;
  final bool? noPadding,noColor;
  final double? radius;
  final double? paddingAll;
  const GetIcons({this.paddingAll,this.noColor,this.radius,this.backgroundColor,this.noPadding,this.onTap,this.iconColor = MyColor.colorBlack,this.size = 3,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius??100)),
      child: Material(
        color: Color(backgroundColor??MyColor.colorTransparent),
        child: InkWell(
          onTap: onTap,
          splashColor: const Color(MyColor.colorSplash),
          child: Padding(
            padding: EdgeInsets.all(noPadding==true?0:ScreenSize().heightOnly(paddingAll??size/100*44)),
            child: SvgPicture.string(
              icon,
              height: ScreenSize().heightOnly(size),
              width: ScreenSize().heightOnly(size),
              color: noColor==true?null:Color(iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
