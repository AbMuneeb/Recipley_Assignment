import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/setting_listener.dart';
import 'package:recipley_assignment/src/prints.dart';

import '../../ApiCalls/ApiCallers/request_url_caller.dart';
import '../../ApiCalls/ApiCallers/show_error.dart';
import '../../ApiCalls/ApiGlobalModel/api_global_model.dart';
import '../../Enums/apistatus_anum.dart';

class InitialDataReceiver
{

  getData(BuildContext context,String token)
  async {

    ApiResponse? apiResponse = await ApiCallUrl().getInitialCategoryCuisineApi(context, token);
    if(apiResponse.apiStatus==ApiStatus.done)
    {
      PrintLogs.printLogs('asdasdas ${apiResponse.data.toJson()}');
      if(apiResponse.data.data.cuisine==null||(apiResponse.data.data.cuisine!=null&&apiResponse.data.data.cuisine.isEmpty))
        {
          return null;
        }
      else if(apiResponse.data.data.category==null||(apiResponse.data.data.category!=null&&apiResponse.data.data.category.isEmpty))
      {
        return null;
      }
      else
        {
          return apiResponse.data.data;
        }
    }
    else
    {
      ShowMessage.show(apiResponse,customMessage: 'Cuisine data is not available');
      return null;
    }
  }
}