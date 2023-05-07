import 'dart:async';

import 'package:recipley_assignment/main.dart';
import 'package:recipley_assignment/src/loader.dart';

mixin GetLoader
{
  StreamController<bool>? loadingStream;
  void initLoader()
  {
    loadingStream = StreamController.broadcast();
    ShowLoaderPopUp.showExtra(GetNavigatorStateContext.navigatorKey.currentContext!,loadingStream!);
  }
  void closeLoader()
  {
    if(loadingStream!=null&&loadingStream!.isClosed==false)
      {
        loadingStream?.add(true);
      }
  }
  disposeLoader()
  {
    loadingStream?.close();
  }
}