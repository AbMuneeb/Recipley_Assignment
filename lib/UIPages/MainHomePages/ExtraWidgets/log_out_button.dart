import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/get_icons.dart';
import 'package:recipley_assignment/src/icons.dart';

import '../../../BusinessLogicModel/Listeners/AuthenticationListener/log_out_listener.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetIcons(icon: SvgPicturesData.logOut,size: 3.8,paddingAll: 0.6,onTap: (){
      MoveOnErrorPage.move(context);
    },);
  }
}
