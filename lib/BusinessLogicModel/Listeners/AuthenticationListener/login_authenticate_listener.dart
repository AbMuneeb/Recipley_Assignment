import 'dart:convert';

import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/Urls/urls.dart';
import 'package:recipley_assignment/BusinessLogicModel/SharedPrefrences/user_info.dart';
import 'package:recipley_assignment/src/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/loader_class.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiCallers/request_url_caller.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiCallers/show_error.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiGlobalModel/api_global_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_request_model.dart';

import '../../../UIPages/ReUseWidgets/TextFields/Listeners/text_field_controller.dart';
import '../../../main.dart';

class LoginAuthenticateListener extends GetChangeNotifier with GetLoader
{
  LoginModel? userData;
  TextFieldControllerCall emailController = TextFieldControllerCall();
  TextFieldControllerCall passwordController = TextFieldControllerCall();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  LoginAuthenticateListener()
  {
    emailController.textEditingController.text = 'test@gmail.com';
    passwordController.textEditingController.text = '123456';
  }
  void start(BuildContext context,LoginRequestModel loginRequestModel)async
  {
    initLoader();
    ApiResponse apiResponse = await ApiCallUrl().loginApi(context, parameters: loginRequestModel.toJson(),urlParameters: '?key=${RequestType.key}');
    closeLoader();
    await Future.delayed(const Duration(milliseconds: 400),()async{
      if(apiResponse.apiStatus == ApiStatus.done)
      {
        userData = apiResponse.data.data;
        await UserInfoPrefs().writeUserInfo(userData?.toJson());
        // await UserEmailInfoPref().writeUserEmailPrefs(EncryptData().startEncryptSimple(jsonEncode(EmailInfoUser(email: loginRequestModel.userName,password: loginRequestModel.password).toJson())),context);
        // await UserInfoPref().writeUserPrefs(jsonEncode(userData?.toJson()), context);
        await Future.delayed(const Duration(milliseconds: 400),(){
          GetNavigatorStateContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(CurrentPage.SettingPage, (route) => false);
        });
      }
      else
      {
        ShowMessage.show(apiResponse);
      }
    });
  }
}