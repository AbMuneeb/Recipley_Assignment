import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class ButtonWidget extends StatefulWidget {
  double? height,width,textSize,extraHeight;
  double? paddingHorizontal,margin;
  String text;
  int? textColor,buttonColor,buttonTapColor;
  FontWeight? weight;
  bool? border,enabled;
  double? elevation;
  VoidCallback onPressed;
  ButtonWidget({required this.onPressed,required this.text,this.buttonTapColor,this.margin,this.elevation,this.width,this.extraHeight,this.height,this.textColor,this.enabled,this.textSize,this.paddingHorizontal,this.buttonColor,this.weight,this.border});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width??double.infinity,
      margin: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(widget.margin??0)),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Color(widget.textColor??MyColor.colorWhite),
            backgroundColor: Color(widget.buttonColor??MyColor.colorPrimary),
            fixedSize: Size(widget.width??double.infinity, widget.extraHeight??ScreenSize().heightOnly(widget.height??5.5)),//c
            padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal??10),
            textStyle: GetFont.get(
              context,
              fontSize: widget.textSize??GetDimens.regularTextHeight,
              fontWeight: widget.weight??FontWeight.w600,
            ),
            elevation: widget.elevation??0,
            shadowColor: Color(MyColor.colorBorderLight).withOpacity(0.8),
            shape: widget.border==true?RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1,
                  color: Color(MyColor.colorBlack)
              ),
              borderRadius: BorderRadius.circular(100),
            ):
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )
        ),
        child: Text(widget.text),
      ),
    );
  }
}

class ButtonCustom extends StatefulWidget {
  double? height,width,textSize;
  double? paddingHorizontal;
  String text;
  int? textColor,buttonColor;
  FontWeight? weight;
  VoidCallback onPressed;
  ButtonCustom({required this.onPressed,required this.text,this.width,this.height,this.textColor,this.textSize,this.paddingHorizontal,this.buttonColor,this.weight});

  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.text),
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(widget.width??double.infinity, widget.height??ScreenSize().heightOnly( 5)),
          primary: Color(widget.buttonColor??MyColor.colorPrimary),
          onPrimary: Color(widget.textColor??MyColor.colorWhite),//c
          padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal??10),
          textStyle: GetFont.get(
            context,
            fontSize: widget.textSize??1.6,
            fontWeight: widget.weight??FontWeight.w400,
          ),

          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15))
      ),
    );
  }
}
class ButtonBorderWidget extends StatelessWidget {
  final Function()? onTap;
  final String header;
  final double? width;
  const ButtonBorderWidget({required this.onTap,required this.header,this.width,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width!=null?ScreenSize().widthOnly( width):double.infinity,
        height: ScreenSize().heightOnly( 6.5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(
                width: 1,
                color: const Color(MyColor.colorBlack).withOpacity(0.16)
            )
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Material(
            color: const Color(MyColor.colorTransparent),
            child: InkWell(
              splashColor: const Color(MyColor.colorSplash),
              onTap: onTap,
              child: Center(
                child: Text(
                  header,
                  style: GetFont.get(
                      context,
                      fontSize: 2.2,
                      fontWeight: FontWeight.w600,
                      color: MyColor.colorBlack
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
