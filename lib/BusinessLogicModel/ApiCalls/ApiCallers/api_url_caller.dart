import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiCallers/model_decider.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/ApiGlobalModel/api_global_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/DioSetup/dio_setup.dart';
import 'package:recipley_assignment/BusinessLogicModel/ApiCalls/Urls/urls.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/InternetListener/internet_listener.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_model.dart';
import 'package:recipley_assignment/src/prints.dart';
import 'package:recipley_assignment/src/strings.dart';

class GetUiApiCaller
{
  Type type;
  String? extraBaseUrl;
  String endPoint;
  bool? isPost,authHeaders;
  dynamic headers;
  dynamic parameters;
  dynamic urlParameters;

  GetUiApiCaller({
    required this.endPoint,
    required this.type,
    this.isPost,
    this.extraBaseUrl,
    this.authHeaders,
    this.urlParameters,
    this.parameters,
    this.headers});

  Future<ApiResponse> callApi(BuildContext context)
  async {
    Response? response;
    if(Provider.of<CheckInternetConnection>(context,listen: false).internetConnectionEnum == InternetConnectionEnum.available)
    {

      try{
        if(isPost==true)
          {
            response = await DioSetUp().getDio().post(
              urlParameters!=null?'${extraBaseUrl??RequestType.baseUrl}$endPoint$urlParameters':'${extraBaseUrl??RequestType.baseUrl}$endPoint',
              data: parameters,
              options: Options(
                sendTimeout: RequestType.timeOut,
                receiveTimeout: RequestType.timeOut,
                headers: headers??{
                  "Content-Type": "application/json"
                  //HttpHeaders.authorizationHeader: authHeaders==true?null:"Bearer ${userData?.token}",
                },
              ),
            );
          }
        else
          {
            response = await DioSetUp().getDio().get(
              urlParameters!=null?'${extraBaseUrl??RequestType.baseUrl}$endPoint${urlParameters??''}':'${extraBaseUrl??RequestType.baseUrl}$endPoint',
              options: Options(
                sendTimeout: RequestType.timeOut,
                receiveTimeout: RequestType.timeOut,
                headers: {
                  "Content-Type": "application/json"
                  // HttpHeaders.authorizationHeader: authHeaders==true?null:"Bearer ${userData?.token}",
                },
              ),
            );
          }
        PrintLogs.printLogs('responseeeeee ${response.statusCode} ${jsonEncode(response.data)}');
        if(response.data!=null)
        {
          ApiResponse apiResponse = ApiResponse(response.statusMessage!,response.statusCode!,ApiStatus.done,ModelDecider.getModel(type, response.data));

          if(apiResponse.code==GetVariable.success&&apiResponse.data!=null&&apiResponse.data.data!=null)
          {
            apiResponse.apiStatus = ApiStatus.done;
            if(apiResponse.data?.data is List&&apiResponse.data!.data!.isEmpty)
              {
                apiResponse.apiStatus = ApiStatus.empty;
              }
            // if(apiResponse.data?.data !=null&&apiResponse.data?.data is List&&apiResponse.data?.data!.isEmpty)
            // {
            //   apiResponse.apiStatus = ApiStatus.empty;
            // }
            return apiResponse;
          }
          else
            {
              apiResponse.apiStatus = ApiStatus.error;
              if(apiResponse.data?.message!=null&&apiResponse.data!.message.isNotEmpty)
              {
                apiResponse.message = apiResponse.data!.message;
              }
              return apiResponse;
            }
        }
        else{
          return ApiResponse(response.statusMessage!,response.statusCode!,ApiStatus.empty,null);
        }
      }on DioError catch(e)
      {
        if (e.response != null) {
          PrintLogs.printLogs('${e.response?.statusCode}');
          PrintLogs.printLogs(e.response?.data);
          // PrintLogs.printLogs(e.response?.headers);
          // PrintLogs.printLogs(e.response?.requestOptions);
          if(e.response?.statusCode==401)
            {
              return ApiResponse(GetVariable.reLogin,e.response?.statusCode,ApiStatus.unAuthorized,null);
            }
          return ApiResponse(e.response?.statusMessage,e.response?.statusCode,ApiStatus.error,null);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          PrintLogs.printLogs(e.requestOptions);
          PrintLogs.printLogs(e.message);
          if(response?.statusCode==401)
          {
            return ApiResponse(GetVariable.reLogin,e.response?.statusCode,ApiStatus.unAuthorized,null);
          }
          return ApiResponse(e.message,response?.statusCode,ApiStatus.error,null);
        }
      }
    }
    else{
      return ApiResponse('GetVariable.noInternet',-1,ApiStatus.noInternet,null);
    }
  }
}