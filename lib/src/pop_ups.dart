import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

class PopUpEnableGps extends StatefulWidget {
  String header,description,buttonText;
  PopUpEnableGps(this.header,this.description,this.buttonText);

  @override
  _PopUpEnableGpsState createState() => _PopUpEnableGpsState();
}

class _PopUpEnableGpsState extends State<PopUpEnableGps> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(MyColor.colorTransparent),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: ScreenSize().heightOnly(20),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.all(ScreenSize().heightOnly(2.4)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(15)),
              color: const Color(MyColor.colorWhite),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 6
                )
              ]
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(widget.header,
                  style: GetFont.get(
                      context,
                      fontSize: 2.4,
                      fontWeight: FontWeight.w600,
                      color:MyColor.colorBlack
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.description,
                  style: GetFont.get(
                      context,
                      fontSize: 1.8,
                      fontWeight: FontWeight.w400,
                      color:MyColor.colorGrey
                  ),),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text(widget.buttonText,
                      style: GetFont.get(
                          context,
                          fontSize: 2.4,
                          fontWeight: FontWeight.w600,
                          color:MyColor.colorPrimary
                      ), ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}