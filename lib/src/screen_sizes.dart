
import 'package:flutter/material.dart';

import '../main.dart';

class ScreenSize {
  MediaQueryData? queryData;
  static final ScreenSize _screenSize = ScreenSize._internal();
  ScreenSize._internal();
  factory ScreenSize()
  {
    _screenSize.queryData ??= MediaQuery.of(GetNavigatorStateContext.navigatorKey.currentState!.context);
    return _screenSize;
  }

  static MediaQueryData? _queryData;
  dynamic heightOnly(dynamic percent) {

    dynamic size = (_screenSize.queryData!.size.height-((_screenSize.queryData?.padding.top??0)+(_screenSize.queryData?.padding.bottom??0)))/100*percent;
    return size;
  }
  dynamic completeHeightOnly(dynamic percent) {
    dynamic size = (_screenSize.queryData!.size.height)/100*percent;
    return size;
  }

  dynamic widthOnly(dynamic percent) {
    dynamic size = (_screenSize.queryData!.size.width-((_screenSize.queryData?.padding.left??0)+(_screenSize.queryData?.padding.right??0)))/100*percent;
    return size;
  }

  double dptopx(BuildContext context, int dp) {
    _queryData = MediaQuery.of(context);
    double? devicePixelRatio = _queryData?.devicePixelRatio;
    //print('res ${WidgetsBinding.instance.window.devicePixelRatio}');
    double val = dp * devicePixelRatio!;
    //print('val ${val}');
    val = val / 2;
    val.round();
    return val;
  }
}