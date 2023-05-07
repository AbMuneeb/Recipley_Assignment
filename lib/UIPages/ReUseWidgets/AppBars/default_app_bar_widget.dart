import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/log_out_listener.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  String? title;
  Widget? actions;
  AppBarWidget({Key? key,this.title,this.actions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(4.6)),
      height: ScreenSize().heightOnly( 5.5),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(5)),
              child: Material(
                color: const Color(MyColor.colorTransparent),
                child: InkWell(
                  splashColor: const Color(MyColor.colorSplash),
                  onTap:(){
                    MoveOnErrorPage.move(context,normalPop:true);
                  },
                  child:  Padding(
                    padding: EdgeInsets.all(ScreenSize().heightOnly(0.5)),
                    child: SvgPicture.string(SvgPicturesData.backArrowLeft,width: ScreenSize().heightOnly(3.6),height:ScreenSize().heightOnly(3.6),color: const Color(MyColor.colorBlack),),
                  ),
                ),
              ),
            ),
          ),
          if(title!=null)...[
            Align(
                alignment: Alignment.center,
                child: Text(
                  title??'',
                  style: GetFont.get(
                      context,
                      fontSize: 2.0,
                      color: MyColor.colorBlack,
                      fontWeight: FontWeight.w600
                  ),
                )
            ),
          ],
          if(actions!=null)...[
            Align(
              alignment: Alignment.centerRight,
              child: actions!,
            )
          ]
        ],
      ),
    );
  }
}