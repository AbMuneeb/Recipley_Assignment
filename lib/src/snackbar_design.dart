import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipley_assignment/main.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class SnackBarDesign {

  static happySnack(String? message)
  {
    GetNavigatorStateContext.rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBarDesign.getSessionSnackBar(GetNavigatorStateContext.navigatorKey.currentState!.context,message??'Server Error',color: MyColor.colorPrimary,icon: SvgPicturesData.tickIcon));
  }
  static errorSnack(String? message,{double? bottom})
  {
    GetNavigatorStateContext.rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBarDesign.getSessionSnackBar(GetNavigatorStateContext.navigatorKey.currentState!.context,message??'',color: MyColor.colorRed,bottom: bottom,milliSeconds: 2000));
  }
  static showToast(BuildContext context,String? message) {
    final scaffold = Scaffold.of(context);
    ScaffoldMessenger.of(scaffold.context).showSnackBar(
        SnackBarDesign.getSessionSnackBar(GetNavigatorStateContext.navigatorKey.currentState!.context,message??'Server Error',color: MyColor.colorPrimary,icon: SvgPicturesData.tickIcon)
    );
  }
  static SnackBar getSessionSnackBar(BuildContext context,String message, {String? icon,int? color,int? milliSeconds,double? bottom})
  {
    return SnackBar(
      elevation: 6.0,
      backgroundColor: Color(color??MyColor.colorSecondary),
      duration: Duration(milliseconds: milliSeconds??2000),
      margin: EdgeInsets.fromLTRB(ScreenSize().widthOnly(5),0,ScreenSize().widthOnly(5),ScreenSize().heightOnly(bottom??4)),
      content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.string(icon??SvgPicturesData.alert, color: const Color(MyColor.colorWhite), width: 24,height: 24,),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(message,style: GetFont.get(
                      context,
                      color: MyColor.colorWhite,
                      fontSize: 1.6,
                      fontWeight: FontWeight.w400
                  ),),
                ),
              )
            ],
          )),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
  static SnackBar getDownloadedFileViewSnackBar(BuildContext context,String message,Function() onTap, {String? icon,int? color,int? milliSeconds})
  {
    return SnackBar(
      elevation: 6.0,
      key: const Key('DownloadingSnack'),
      backgroundColor: Color(color??MyColor.colorPrimary),
      duration: Duration(milliseconds: milliSeconds??2000),
      content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.string(icon??SvgPicturesData.alert, color: const Color(MyColor.colorWhite), width: 24,height: 24,),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(message,style: GetFont.get(
                      context,
                      color: MyColor.colorWhite,
                      fontSize: 1.7,
                      fontWeight: FontWeight.w400
                  ),),
                ),
              ),
              InkWell(
                splashColor: const Color(MyColor.colorSplash),
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(1),vertical:ScreenSize().heightOnly(0.6)),
                  child: Text(
                    'Show file',
                    style: GetFont.get(
                        context,
                        color: MyColor.colorWhite,
                        fontSize: 1.8,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
            ],
          )
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

