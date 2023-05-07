import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CheckInternetConnection with ChangeNotifier
{
  final Connectivity _connectivity = Connectivity();
  InternetConnectionEnum internetConnectionEnum = InternetConnectionEnum.checking;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.


    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      //print('wifi');
        internetConnectionEnum = InternetConnectionEnum.available;
        notifyListeners();
        break;
      case ConnectivityResult.mobile:
      //print('mobile');
        internetConnectionEnum = InternetConnectionEnum.available;
        notifyListeners();
        break;
      case ConnectivityResult.none:
        internetConnectionEnum = InternetConnectionEnum.notAvailable;
        //print('false');
        notifyListeners();
        break;
      default:
        internetConnectionEnum = InternetConnectionEnum.notAvailable;
        print(' def false');
        notifyListeners();
        break;
    }
  }
}
enum InternetConnectionEnum
{
  available,notAvailable,checking
}