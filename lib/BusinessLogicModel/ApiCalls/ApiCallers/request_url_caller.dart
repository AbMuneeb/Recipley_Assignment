import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiGlobalModel/api_global_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiCallers/api_url_caller.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/Urls/urls.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/InitialCategoryCuisineModel/initial_food_data_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/FoodModel/food_model.dart';

class ApiCallUrl
{
  Future<ApiResponse> loginApi(BuildContext context,{required dynamic parameters,required String urlParameters})async
  {
    return await GetUiApiCaller(extraBaseUrl: RequestType.loginBaseUrl,endPoint: '',isPost: true, parameters: parameters,urlParameters: urlParameters, type: LoginModel).callApi(context);
  }
  Future<ApiResponse> getFoodApi(BuildContext context,String auth)async
  {
    return await GetUiApiCaller(endPoint: RequestType.food,isPost: false,urlParameters: '?auth=$auth', type: FoodModel).callApi(context);
  }
  Future<ApiResponse> getInitialCategoryCuisineApi(BuildContext context,String auth)async
  {
    return await GetUiApiCaller(endPoint: RequestType.data,isPost: false,urlParameters: '?auth=$auth', type: FoodInitialDataModel).callApi(context);
  }

}