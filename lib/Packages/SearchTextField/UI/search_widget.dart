import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/Packages/SearchTextField/Listener/search_controller.dart';

import '../../../UIPages/ReUseWidgets/TextFields/text_field.dart';

class SearchBarWidget extends StatelessWidget {
  Function(String) textCallBack;
  SearchBarWidget({required this.textCallBack,Key? key}) : super(key: key);

  Timer? searchOnStoppedTyping;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchListener>(
      create: (_) => SearchListener(textCallBack: textCallBack),
      builder: (context, snapshot) {
        return Consumer<SearchListener>(
          builder: (context, data, child) {
            return TextWidget(data.textFieldControllerCall,TextInputAction.done,data.focusNode, const Key('Password'),'enter your password',callBack: data.response,textInputType: TextInputType.text,searchIcon: true,height: 7,margin: 0,noHeader: true,);
          }
        );
      }
    );
  }
}
