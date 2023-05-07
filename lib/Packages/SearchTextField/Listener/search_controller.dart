import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/AbstractClasses/over_loaded_changeNotifier.dart';
import 'package:recipley_assignment/Packages/SearchTextField/Listener/search_constants.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextFields/Listeners/text_field_controller.dart';

class SearchListener extends GetChangeNotifier
{
  Function(String) textCallBack;
  Timer? searchOnStoppedTyping;
  late TextFieldControllerCall textFieldControllerCall;
  late FocusNode focusNode;
  var lastTextEdit = 0;

  SearchListener({required this.textCallBack})
  {
    textFieldControllerCall = TextFieldControllerCall();
    focusNode = FocusNode();
  }

  void response(String text)
  {
    if(text.isNotEmpty&&text.replaceAll(' ', '').isNotEmpty) {
      if (searchOnStoppedTyping != null) {
        searchOnStoppedTyping?.cancel(); // clear timer
      }
      lastTextEdit=DateTime.now().millisecondsSinceEpoch;
      searchOnStoppedTyping = Timer(Duration(milliseconds: SearchConstants.initialDelay), () {
        if(DateTime.now().millisecondsSinceEpoch>(lastTextEdit + SearchConstants.initialDelay - SearchConstants.totalDelay))
        {
          textCallBack(text);
        }
      });

    }
  }

  @override
  void dispose() {
    textFieldControllerCall.dispose();
    focusNode.dispose();
    searchOnStoppedTyping?.cancel();
    super.dispose();
  }
}