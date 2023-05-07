import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/AppBars/app_bar_with_cross.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class ShowBottomSheet
{
  static show(BuildContext context,{required Function(dynamic) callBack,bool? enableDrag,bool? isDismissible,double? height,Widget? appBar,Widget? body,Widget? builder,String? optionalDefaultAppBarText,double? borderRadius,bool? expand,bool? topSafeRemove})
  {
    showMaterialModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isDismissible: isDismissible??true,
      expand: expand??false,
      enableDrag: enableDrag??true,
      backgroundColor: Color(MyColor.colorWhite),
      elevation: 6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius??15),topRight: Radius.circular(borderRadius??15))
      ),
      builder: (builderContext) => builder??SizedBox(
        height: ScreenSize().heightOnly(height??100),
        child: SafeArea(
          top: topSafeRemove??false,
          bottom: false,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius??15),topRight: Radius.circular(borderRadius??15)),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child:Scaffold(
                primary: topSafeRemove??false,
                extendBody: topSafeRemove??false,
                resizeToAvoidBottomInset: false,
                extendBodyBehindAppBar: false,
                backgroundColor: const Color(MyColor.colorWhite),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(MyColor.colorWhite),
                  elevation: 0,
                  titleSpacing: 0,
                  toolbarHeight: ScreenSize().heightOnly(9),
                  title: appBar??AppBarWithCrossTitle(text: optionalDefaultAppBarText??'',),
                ),
                body: body,
              ),
            ),
          ),
        ),
      ),
    ).then((value){
      callBack(value);
    });
  }
}