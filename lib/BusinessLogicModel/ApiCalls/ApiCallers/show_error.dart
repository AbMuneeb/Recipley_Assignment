import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiGlobalModel/api_global_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/log_out_listener.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/VibratorListener/vibrator_listener.dart';
import 'package:recipley_assignment/main.dart';
import 'package:recipley_assignment/src/snackbar_design.dart';

class ShowMessage
{
  static show(ApiResponse apiResponse,{String? customMessage})
  {
    Future.delayed(
        const Duration(milliseconds: 150),
            (){

          if(apiResponse.message!=null&&apiResponse.message!.isNotEmpty)
          {
            Vibrator.errorVibrate();
            SnackBarDesign.errorSnack(apiResponse.message??'');
          }
          else
            {
              Vibrator.errorVibrate();
              SnackBarDesign.errorSnack(customMessage??'Server error');
            }
          if(apiResponse.apiStatus == ApiStatus.unAuthorized)
          {
            Future.delayed(const Duration(milliseconds: 50),(){
              MoveOnErrorPage.move(GetNavigatorStateContext.navigatorKey.currentState!.context);
            });
          }
        }
    );
  }
}