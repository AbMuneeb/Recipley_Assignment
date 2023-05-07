import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/AppBars/default_app_bar_widget.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Default_Screens/default_screen_bodies.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/hide_keyboard.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

import '../../../BusinessLogicModel/Enums/location_from_enums.dart';

class GetPageStarterScaffold extends StatelessWidget {
  final int? screenColor;
  final double? paddingHorizontally;
  final double? elevation;
  final bool? pinned,float,withScrollView;
  final String? title;
  final PreferredSizeWidget? bottomAppBar;
  final bool? addToolBarHeight;
  final Widget body;
  final Widget? appBar;
  final Widget? flexibleSpace;
  final Widget? bottomWidget;
  final Widget? floatingActionButton;
  const GetPageStarterScaffold({
    this.bottomWidget,
    this.floatingActionButton,
    this.appBar,
    this.withScrollView,
    this.paddingHorizontally = 0,
    this.bottomAppBar,
    this.pinned,
    this.float,
    this.elevation = 0,
    this.addToolBarHeight = false,
    this.screenColor,
    this.flexibleSpace,
    required this.body,
    this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        HideShowKeyboard.hide(context);
      },
      child: Scaffold(
        backgroundColor: Color(MyColor.colorWhite),
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              addToolBarHeight==true? SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: pinned??false,
                floating: pinned==true?false:float??true,
                snap: pinned==true?false:float??true,
                backgroundColor: Color(MyColor.colorWhite),
                title: appBar??AppBarWidget(title: title),
                //${CallLanguageKeyWords.get(context, LanguageCodes.services)}
                titleSpacing: 0,
                toolbarHeight: ScreenSize().heightOnly(19),
                elevation: elevation??0,
                bottom: bottomAppBar,
                flexibleSpace: flexibleSpace!=null?FlexibleSpaceBar(
                  background: flexibleSpace,
                ):null,
              ):SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: pinned??false,
                floating: pinned==true?false:float??true,
                snap: pinned==true?false:float??true,
                backgroundColor: Color(MyColor.colorWhite),
                title: appBar??AppBarWidget(title: title),
                //${CallLanguageKeyWords.get(context, LanguageCodes.services)}
                titleSpacing: 0,
                //toolbarHeight: MediaQuery.of(context).padding.top,
                elevation: 0,
                bottom: bottomAppBar,
                flexibleSpace: flexibleSpace!=null?FlexibleSpaceBar(
                  background: flexibleSpace,
                ):null,
              )
            ];
          },
          body: withScrollView==true?GetBodyWidgetWithScrollView(body: body,paddingHorizontally:paddingHorizontally!):GetBodyWidgetWithOutScrollView(body: body,paddingHorizontally:paddingHorizontally)

        ),
        bottomNavigationBar: bottomWidget,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
class GetPageStarterScaffoldWithOutSliverAppBar extends StatelessWidget {
  final int? screenColor;
  final double? paddingHorizontally;
  final bool? withScrollView;
  final String title;
  final PreferredSizeWidget? bottom;
  final Widget body;
  final Widget? flexibleSpace;
  const GetPageStarterScaffoldWithOutSliverAppBar({this.withScrollView,this.paddingHorizontally=0,this.bottom,this.screenColor,this.flexibleSpace,required this.body,required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(screenColor??MyColor.colorWhite),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(MyColor.colorWhite),
          title: AppBarWidget(title: title),
          //${CallLanguageKeyWords.get(context, LanguageCodes.services)}
          titleSpacing: 0,
          elevation: 0,
          bottom: bottom,
          flexibleSpace: flexibleSpace!=null?FlexibleSpaceBar(
            background: flexibleSpace,
          ):null,
        ),
        body: withScrollView==true?GetBodyWidgetWithScrollView(body: body,paddingHorizontally:paddingHorizontally!):GetBodyWidgetWithOutScrollView(body: body,paddingHorizontally:paddingHorizontally)
    );
  }
}

