import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiCallers/request_url_caller.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiGlobalModel/api_global_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/InitialCategoryCuisineModel/initial_food_data_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/FoodModel/food_model.dart';
import 'package:recipley_assignment/main.dart';

import '../../../src/pages_name.dart';
import '../../Models/AuthenticationModel/login_model.dart';
import '../../SharedPrefrences/user_info.dart';
import '../InitialDataReceiver/initial_data_receiver.dart';

class SettingListener extends GetChangeNotifier
{
  LoginModel? loginModel;
  InitialData? data;

  ApiStatus apiStatus = ApiStatus.nothing;

  Future<void> start(BuildContext context) async {
    loginModel = await UserInfoPrefs().getUserInfo();
    if(loginModel!=null&&loginModel?.idToken!=null)
    {
      data = await InitialDataReceiver().getData(context, loginModel!.idToken!);
      if(data !=null)
        {
          GetNavigatorStateContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(CurrentPage.MainHomePage, (route) => false);
        }
      else
        {
          apiStatus = ApiStatus.error;
          notifyListeners();
        }
    }
    else
    {
      GetNavigatorStateContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(CurrentPage.LoginPage, (route) => false);
    }
  }

}