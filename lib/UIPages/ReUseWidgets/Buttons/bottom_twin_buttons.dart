import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class BottomTwinButtons extends StatelessWidget {
  final String acceptText,rejectText;
  final String? acceptIcon,rejectIcon;
  final double? iconSize,textSize;
  final int? rejectColor,acceptColor;
  final Function() acceptCallBack,rejectCallBack;
  const BottomTwinButtons({required this.acceptCallBack,required this.rejectCallBack,required this.acceptText,required this.rejectText,this.acceptIcon,this.rejectIcon,this.iconSize,this.textSize,this.acceptColor,this.rejectColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        bottom: true,
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom>0?0:ScreenSize().heightOnly(4.4)),
          child: Row(
            children: [
              DividerHorizontal(6),
              Expanded(child: ButtonIs(callBack: rejectCallBack,text: rejectText,icon: rejectIcon,iconSize: iconSize,textSize: textSize,borderDesign: true,)),
              DividerHorizontal(4),
              Expanded(child: ButtonIs(callBack: acceptCallBack,text: acceptText,icon: acceptIcon,iconSize: iconSize,textSize: textSize,)),
              DividerHorizontal(6),
            ],
          ),
        ),
      ),
    );
  }
}
class ButtonIs extends StatelessWidget {
  final String text;
  final String? icon;
  final double? iconSize,textSize;
  final bool? borderDesign;
  final int? color;
  final Function() callBack;
  const ButtonIs({required this.callBack,required this.text,this.icon,this.iconSize,this.textSize,this.borderDesign,this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: borderDesign==true?Border.all(
          width: 1,
          color: Color(MyColor.colorGreyExtra)
        ):null,
        color: borderDesign==true?null:Color(MyColor.colorPrimary)
      ),
      child: Material(
        color: const Color(MyColor.colorTransparent),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: InkWell(
          splashColor: const Color(MyColor.colorSplash),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          onTap: callBack,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenSize().heightOnly(1.6)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if(icon!=null)...[
                  SvgPicture.string(
                    icon!,
                    height: ScreenSize().heightOnly(iconSize??2),
                    width: ScreenSize().heightOnly(iconSize??2),
                    color: Color(color??MyColor.colorBlack),
                  ),
                  const DividerHorizontal(2),
                ],
                RegularText(text,color: color??MyColor.colorBlack,fontSize: textSize??2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

