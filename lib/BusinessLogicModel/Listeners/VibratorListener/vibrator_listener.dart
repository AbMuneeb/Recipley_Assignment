import 'package:flutter/services.dart';

class Vibrator
{
  static void clickVibrate()
  {
    HapticFeedback.selectionClick();
  }
  static void mediumVibrate()
  {
    HapticFeedback.mediumImpact();
  }
  static void errorVibrate()
  {
    HapticFeedback.heavyImpact();
  }
}