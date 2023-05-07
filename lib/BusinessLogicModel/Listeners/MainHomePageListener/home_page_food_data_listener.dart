import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/setting_listener.dart';
import 'package:recipley_assignment/src/prints.dart';

import '../../ApiCalls/ApiCallers/request_url_caller.dart';
import '../../ApiCalls/ApiCallers/show_error.dart';
import '../../ApiCalls/ApiGlobalModel/api_global_model.dart';
import '../../Enums/apistatus_anum.dart';
import '../../Models/FoodModel/food_model.dart';
import '../../Models/InitialCategoryCuisineModel/selected_wrapper_model.dart';

class FoodDataListener extends GetChangeNotifier
{
  ApiStatus apiStatus = ApiStatus.nothing;
  List<FoodData>? originalListData;
  List<FoodData>? filteredListData;
  bool? _filterApplied;
  String? searchText;
  SelectedFilterWrapper? appliedFilters;


  get filterApplied => _filterApplied;

  start(BuildContext context)
  async {
    apiStatus = ApiStatus.started;
    notifyListeners();

    SettingListener settingListener = Provider.of(context,listen: false);
    ApiResponse? apiResponse = await ApiCallUrl().getFoodApi(context, settingListener.loginModel!.idToken!);
    if(apiResponse.apiStatus==ApiStatus.done)
    {
      originalListData = apiResponse.data.data;
      filteredListData = apiResponse.data.data;
      apiStatus = ApiStatus.done;
    }
    else if(apiResponse.apiStatus==ApiStatus.empty)
    {
      apiStatus = ApiStatus.empty;
    }
    else
    {
      apiStatus = ApiStatus.error;
      ShowMessage.show(apiResponse);
    }
    notifyListeners();
  }

  void selectedFilters(dynamic value) {
    /// So if filters not null then obviously data user click apply filter otherwise he clicks clear all
    /// if clear all click then show original list
    if(value!=null&&value is Map<String, dynamic>)
    {
      PrintLogs.printLogs('asbhjdasjhdas');
      _filterApplied = true;
      appliedFilters = SelectedFilterWrapper.fromJson(value);
      applyFilter();
    }
    else
    {
      /// this will be called if user click clear all
      PrintLogs.printLogs('yyyyyasbhjdasjhdas');
      _filterApplied = false;
      appliedFilters = null;
      filteredListData = originalListData;
      apiStatus = ApiStatus.done;
      notifyListeners();
    }
  }
  applyFilter()
  {
    /// just for safe case check
    if(appliedFilters!=null)
    {
      // PrintLogs.printLogs('insideasdas');
      /// First extract only selected categories and cuisines by user
      List<WrapperDataModel>? category = appliedFilters?.category?.where((element) => element.selected == true).toList();
      List<WrapperDataModel>? cuisine = appliedFilters?.cuisine?.where((element) => element.selected == true).toList();

      // PrintLogs.printLogs('insideasdas ${category?.length} ${cuisine?.length}');
      filteredListData = originalListData?.where((food) {

        /// checking if any category match found
        bool isCategoryMatch = category!=null&&category.isNotEmpty && category.any((category) => food.categoryId == category.id);

        /// checking if any cuisine match found
        bool isCuisineMatch = cuisine!=null&&cuisine.isNotEmpty && cuisine.any((cuisine) => food.cuisineId == cuisine.id);

        bool returnValue = false;
        if(searchText!=null&&searchText!.isNotEmpty&&searchText!.replaceAll(' ', '').isNotEmpty&&(food.name!.toLowerCase().startsWith(searchText!) == true || food.name!.toLowerCase().contains(searchText!) == true))
        {
          returnValue = true;
          if((category!=null)||(cuisine!=null))
            {
              if(isCategoryMatch == true||isCuisineMatch == true)
                {
                  returnValue = true;
                }
              else
                {
                  returnValue = false;
                }
            }
        }


        /// if any one of match found then return result to food list
        return (searchText!=null&&searchText!.isNotEmpty&&searchText!.replaceAll(' ', '').isNotEmpty)?returnValue:(isCategoryMatch || isCuisineMatch);
      }).toList();

      // PrintLogs.printLogs('total ${filteredListData?.length}');

      updateStatus();
    }

  }

  Future<void> searchViaText(String searchValue) async {
    // PrintLogs.printLogs('valueasdasas $searchText ${originalListData?.length}');
    searchText = searchValue;
    if(appliedFilters!=null)
      {
        applyFilter();
      }
    else
      {
        if(searchText!=null&&searchText!.isNotEmpty&&searchText!.replaceAll(' ', '').isNotEmpty)
          {
            filteredListData = originalListData?.where((food) => food.name!.toLowerCase().startsWith(searchText!) == true || food.name!.toLowerCase().contains(searchText!) == true).toList();
          }
        else
          {
            filteredListData = originalListData;
          }
        updateStatus();
      }

  }
  updateStatus()
  {
    if(filteredListData!=null&&filteredListData!.isNotEmpty)
    {
      apiStatus = ApiStatus.done;
      notifyListeners();
    }
    else
    {
      filteredListData = null;
      apiStatus = ApiStatus.empty;
      notifyListeners();
    }
  }
}