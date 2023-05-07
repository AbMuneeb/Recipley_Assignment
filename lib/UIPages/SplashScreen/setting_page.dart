import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/setting_listener.dart';

import '../../BusinessLogicModel/Listeners/InternetListener/internet_listener.dart';
import '../../src/divider.dart';
import '../../src/lottie_files.dart';
import '../../src/pages_name.dart';
import '../../src/screen_sizes.dart';
import '../../src/strings.dart';
import '../ReUseWidgets/NotAvailableText/not_available_text.dart';
import '../ReUseWidgets/PopUps/no_internet_widget.dart';
import '../ReUseWidgets/TextWidgets/bold_text.dart';
import '../ReUseWidgets/TextWidgets/regular_text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(MyColor.colorGreyPrimary),
        body: SafeArea(
            bottom: true,
            top: true,
            right: true,
            left: true,
            child: Consumer<CheckInternetConnection>(
                builder: (context, dataInternet, child) {
                  if (dataInternet.internetConnectionEnum == InternetConnectionEnum.available) {
                    return StartSettingPage();
                  } else {
                    return NoInternetJustAnim(GetVariable.noInternet, margin: 6,);
                  }
                }
            )
        )
    );
  }

}
class StartSettingPage extends StatefulWidget {
  const StartSettingPage({Key? key}) : super(key: key);

  @override
  State<StartSettingPage> createState() => _StartSettingPageState();
}

class _StartSettingPageState extends State<StartSettingPage> {

  bool animateNow=false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
      Provider.of<SettingListener>(context,listen: false).start(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingListener>(
      builder: (context, data, child) {
        // if(data.apiStatus == ApiStatus.error)
        //   {
        //     return NotAvailableView(header: 'Opps!!!',text: 'Currently we have nothing to offer please try again later',);
        //   }
        return Container(
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
                  child: Lottie.asset(LottieString.welcome,
                      fit: BoxFit.fitWidth, repeat: true,animate: true),
                ),
              ),
              //DividerVertical(2),
              AnimatedOpacity(
                opacity: animateNow? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: BoldText('Welcome to\nRecipley',fontSize: 2.2,textAlign: TextAlign.center,),
              ),
              DividerVertical(1.5),
              AnimatedOpacity(
                opacity: animateNow? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1500),
                child: RegularText('Please wait we are making things ready for you in a while...',fontSize: 1.6,textAlign: TextAlign.center,),
              ),
              DividerVertical(4),
            ],
          ),
        );
      }
    );
  }
  init()
  {
    Future.delayed(const Duration(milliseconds: 100),(){
      setState(() {
        animateNow=true;
      });
    });
  }
}

