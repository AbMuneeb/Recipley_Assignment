import 'dart:convert';

import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AuthenticationModel/login_model.dart';

class UserInfoPrefs
{
  Future<void> writeUserInfo(var value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserInfoPrefs', jsonEncode(value));
  }

  Future? getUserInfo()async
  {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? d = prefs.getString('UserInfoPrefs');
      if(d!=null)
        {
          return LoginModel.fromJson(jsonDecode(d));
        }
      return null;
    }catch(e){
      return null;
    }
  }
  Future removeUserInfo()
  async {
    try{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove('UserInfoPrefs');

    }catch(e){}
  }

}