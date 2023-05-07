import 'package:recipley_assignment/BusinessLogicModel/SharedPrefrences/user_info.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/bold_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/main.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/lottie_files.dart';
import 'package:recipley_assignment/src/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../src/screen_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animateNow=false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1),(){
        init();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(MyColor.colorGreyPrimary),
        body: SafeArea(
          bottom: true,
          top: true,
          right: true,
          left: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: animateNow? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    width: ScreenSize().heightOnly(42),
                    child: Image.asset('assets/logo.png',
                        fit: BoxFit.fitWidth,),
                  ),
                ),
                //DividerVertical(2),

              ],
            ),
          ),
        )
    );
  }
  init()
  {
    Future.delayed(const Duration(milliseconds: 100),(){
      setState(() {
        animateNow=true;
      });
      Future.delayed(const Duration(milliseconds: 1500),(){
        setState(() {
        });
        checkStatePlease();
      });
    });
  }
  void checkStatePlease()async
  {
    GetNavigatorStateContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(CurrentPage.SettingPage, (route) => false);
  }
}

