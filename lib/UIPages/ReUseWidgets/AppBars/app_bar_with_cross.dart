import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class AppBarWithCrossTitle extends StatelessWidget {
  final String? text;
  const AppBarWithCrossTitle({this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(6),vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              text??'',
              style: GetFont.get(
                  context,
                  fontSize: 2.4,
                  height: 1.4,
                  fontWeight: FontWeight.w700,
                  color: MyColor.colorBlack
              ),
            ),
          ),
          ClipRRect(
            borderRadius:const BorderRadius.all(Radius.circular(5)),
            child: Material(
              color: const Color(MyColor.colorTransparent),
              child: InkWell(
                splashColor: const Color(MyColor.colorGrey),
                onTap:(){
                  Navigator.pop(context);
                },
                child:  Padding(
                  padding: EdgeInsets.all(ScreenSize().heightOnly(0.8)),
                  child: SvgPicture.string(SvgPicturesData.cross,width: ScreenSize().heightOnly( 2.2),height:ScreenSize().heightOnly( 2.2),color: Color(MyColor.colorBlack),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
