import 'dart:io';

import 'package:recipley_assignment/BusinessLogicModel/SharedPrefrences/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipley_assignment/src/pages_name.dart';

import '../../../main.dart';

class MoveOnErrorPage
{
  static move(BuildContext context,{String? pageName,bool? normalPop})async
  {
    if(ModalRoute.of(context)?.settings.name==CurrentPage.LoginPage)
      {
        if(Platform.isAndroid)
          {
            SystemNavigator.pop(animated: true);
          }
        else
          {
            exit(0);
          }
      }
    else
      {
        await UserInfoPrefs().removeUserInfo();
        if(Navigator.canPop(context))
          {
            if(normalPop == true)
              {
                Navigator.pop(context);
              }
            else
              {
                GetNavigatorStateContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(pageName??CurrentPage.LoginPage, (route) => false);
              }
          }
        else
        {
          Navigator.popAndPushNamed(context, pageName??CurrentPage.LoginPage);
        }
      }
  }
}