import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/src/snackbar_design.dart';

import '../../../Models/InitialCategoryCuisineModel/initial_food_data_model.dart';
import '../../../Models/InitialCategoryCuisineModel/selected_wrapper_model.dart';
import '../../AuthenticationListener/setting_listener.dart';

class FilterListener extends GetChangeNotifier
{
  InitialData? allFilters;
  SelectedFilterWrapper? appliedFilters;

  ApiStatus apiStatus = ApiStatus.nothing;

  FilterListener({this.appliedFilters});

  start(BuildContext context)
  {
    apiStatus = ApiStatus.started;
    notifyListeners();

    /// Get data from setting listener and it won't be null because when app start we are confirming that if
    /// this data is null then obviously app cannot be started

    SettingListener settingListener = Provider.of(context,listen: false);
    allFilters = settingListener.data;

    /// If no previous filter is applied then obviously it will be null and it is getting applied for the first time
    if(appliedFilters==null)
    {
      appliedFilters = SelectedFilterWrapper();
      appliedFilters?.category = List.generate(settingListener.data?.category?.length??0,
              (index) => WrapperDataModel(id: settingListener.data?.category?[index].id)
      );
      appliedFilters?.cuisine = List.generate(settingListener.data?.cuisine?.length??0,
              (index) => WrapperDataModel(id: settingListener.data?.cuisine?[index].id)
      );
    }
    apiStatus = ApiStatus.done;
    notifyListeners();
  }

  selectedFilterFromCuisine(int index)
  {
    if(appliedFilters?.cuisine?[index].selected==true)
      {
        appliedFilters?.cuisine?[index].selected=false;
      }
    else
      {
        appliedFilters?.cuisine?[index].selected=true;
      }
    notifyListeners();
  }
  selectedFilterFromCategory(int index)
  {
    if(appliedFilters?.category?[index].selected==true)
      {
        appliedFilters?.category?[index].selected=false;
      }
    else
      {
        appliedFilters?.category?[index].selected=true;
      }
    notifyListeners();
  }

  void applyFilters(BuildContext context) {
    int? indexCategory = appliedFilters?.category?.indexWhere((element) => element.selected==true);
    int? indexCuisine = appliedFilters?.cuisine?.indexWhere((element) => element.selected==true);
    if((indexCategory!=null&&indexCategory!=-1)||(indexCuisine!=null&&indexCuisine!=-1))
      {
        Navigator.pop(context,appliedFilters?.toJson());
      }
    else
      {
        SnackBarDesign.errorSnack('In order to apply filter please select a filter first');
      }
  }

  void clearAll(BuildContext context) {
    appliedFilters = null;
    notifyListeners();

    Navigator.pop(context,null);
  }
}
