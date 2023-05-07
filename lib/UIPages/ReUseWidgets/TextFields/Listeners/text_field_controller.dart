import 'package:flutter/material.dart';

class TextFieldControllerCall
{
  late TextEditingController textEditingController;
  VoidCallback? showErrorFunction;
  String? errorMessage;
  VoidCallback? hideErrorFunction;

  TextFieldControllerCall()
  {
    textEditingController = TextEditingController();
  }
  void hideError()
  {
    try{
      hideErrorFunction!();
      errorMessage = null;
    }catch(e){}
  }
  void showError(String? error)
  {
    errorMessage = error;
    try{
      showErrorFunction!();
    }catch(e){
      errorMessage = null;
    }
  }
  dispose()
  {
    showErrorFunction = null;
    hideErrorFunction = null;
    errorMessage = null;
    hideErrorFunction = null;
    textEditingController.dispose();
  }

}