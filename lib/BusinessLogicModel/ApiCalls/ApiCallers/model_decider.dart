import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_model.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/FoodModel/food_model.dart';

import '../../Models/InitialCategoryCuisineModel/initial_food_data_model.dart';
import '../../Models/extra_models.dart';

class ModelDecider
{
  static getModel(Type type,dynamic json)
  {
    switch(type)
    {
      case LoginModel:
        return Data(LoginModel.fromJson(json));
      case FoodInitialDataModel:
        return FoodInitialDataModel.fromJson(json);
      case FoodModel:
        return FoodModel.fromJson(json);
      default:
        return null;
    }
  }
}
