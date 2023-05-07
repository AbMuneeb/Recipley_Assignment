import 'package:recipley_assignment/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/InternetListener/internet_listener.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/PopUps/no_internet_widget.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

class GetBodyWidgetWithScrollView extends StatelessWidget {
  final double paddingHorizontally;
  final Widget body;
  const GetBodyWidgetWithScrollView({required this.body,required this.paddingHorizontally,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(paddingHorizontally)),
        child: Consumer<CheckInternetConnection>(
            builder: (context, dataInternet, child) {
              if (dataInternet.internetConnectionEnum == InternetConnectionEnum.available) {
                return body;
              } else {
                return NoInternetJustAnim(GetVariable.noInternet, margin: 6,);
              }
            }
        )
    );
  }
}
class GetBodyWidgetWithOutScrollView extends StatelessWidget {
  final double? paddingHorizontally;
  final Widget body;
  const GetBodyWidgetWithOutScrollView({required this.body,this.paddingHorizontally,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(paddingHorizontally ?? 0)),
        child: Consumer<CheckInternetConnection>(
            builder: (context, dataInternet, child) {
              if (dataInternet.internetConnectionEnum == InternetConnectionEnum.available) {
                return body;
              } else {
                return NoInternetJustAnim(GetVariable.noInternet, margin: 6,);
              }
            }
        )
    );
  }
}

