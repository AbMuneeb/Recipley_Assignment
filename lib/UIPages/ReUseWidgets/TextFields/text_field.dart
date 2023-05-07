import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextFields/Formatters/phone_mask_formatter.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextFields/Listeners/text_field_controller.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class TextWidget extends StatelessWidget {
  String? textFieldHeader;
  double? margin;
  bool? isCompulsory;
  TextFieldControllerCall? controller;
  Key? key;
  TextInputType? textInputType;
  String? hintText,errorText;
  String? restrictionRegex;
  FocusNode? focusNode;
  bool? isPasswordField=false;
  double? stroke;
  TextInputAction? textInputAction;
  EdgeInsetsGeometry? contentPadding;
  double? padding,height;
  bool? noHeader;
  Function()? filterTap;
  IconData? icon,suffixIcon;
  bool? searchIcon;
  bool? isEnabled,showCalender,onTap,isPhoneNumber;
  DateTime? minYears,maxYears;
  Function(String)? callBack;
  TextWidget(this.controller,this.textInputAction,this.focusNode,this.key,this.hintText,{this.filterTap,this.suffixIcon,this.noHeader,this.maxYears,this.isPhoneNumber,this.errorText,this.onTap,this.margin,this.textFieldHeader,this.isCompulsory,this.callBack,this.searchIcon,this.height,this.stroke,this.padding,this.icon,this.restrictionRegex,this.isPasswordField,this.isEnabled,this.textInputType,this.showCalender,this.minYears}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TextFieldUiListener>(create: (_) => TextFieldUiListener())
        ],
        child: ShowTextWidget(controller,textInputAction,focusNode,key,hintText,filterTap: filterTap,noHeader: noHeader,isPhoneNumber: isPhoneNumber,suffixIcon: suffixIcon,maxYears: maxYears,errorText: errorText, margin: margin,textFieldHeader: textFieldHeader,isCompulsory:isCompulsory,callBack:callBack,searchIcon:searchIcon,height:height,stroke:stroke,padding:padding,contentPadding:contentPadding,icon:icon,restrictionRegex:restrictionRegex,isPasswordField:isPasswordField,isEnabled:isEnabled,textInputType:textInputType,onTap: onTap,showCalender: showCalender,minYears: minYears,));
  }
}

class ShowTextWidget extends StatefulWidget {
  String? textFieldHeader;
  double? margin;
  bool? isCompulsory;
  Function()? filterTap;
  TextFieldControllerCall? controller;
  Key? key;
  TextInputType? textInputType;
  String? hintText,errorText;
  String? restrictionRegex;
  FocusNode? focusNode;
  bool? isPasswordField=false,isPhoneNumber=false;
  double? stroke;
  TextInputAction? textInputAction;
  EdgeInsetsGeometry? contentPadding;
  double? padding,height;
  IconData? icon,suffixIcon;
  bool? searchIcon,onTap;
  bool? noHeader;
  bool? isEnabled,showCalender;
  DateTime? minYears,maxYears;
  Function(String)? callBack;
  //Function(bool)? callError;
  ShowTextWidget(this.controller,this.textInputAction,this.focusNode,this.key,this.hintText,{this.filterTap,this.suffixIcon,this.noHeader,this.isPhoneNumber,this.maxYears,this.errorText,this.onTap,this.margin,this.textFieldHeader,this.isCompulsory,this.callBack,this.searchIcon,this.height,this.stroke,this.padding,this.contentPadding,this.icon,this.restrictionRegex,this.isPasswordField,this.isEnabled,this.textInputType,this.showCalender,this.minYears}) : super(key: key);
  @override
  State<ShowTextWidget> createState() => _ShowTextWidgetState();
}

class _ShowTextWidgetState extends State<ShowTextWidget> {
  bool hideText=true;

  @override
  void initState() {
    widget.controller?.showErrorFunction = showError;
    widget.controller?.hideErrorFunction = hideError;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.focusNode?.addListener(() {
        if(widget.focusNode?.hasFocus==true)
        {
          hideError();
          if(mounted)Provider.of<TextFieldUiListener>(context,listen: false).updateFocus(true);
        }
        else
        {
          hideError();
          if(mounted)Provider.of<TextFieldUiListener>(context,listen: false).updateFocus(false);
        }
      });
    });
    super.initState();
  }
  void showError()
  {
    widget.errorText = widget.controller?.errorMessage;
    if(mounted)Provider.of<TextFieldUiListener>(context,listen: false).notifyAll();
  }
  void hideError()
  {
    widget.errorText = null;
    if(mounted)Provider.of<TextFieldUiListener>(context,listen: false).notifyAll();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldUiListener>(
        builder: (context, data, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(widget.margin??5.6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.noHeader != true)...[
                  Flexible(child: MediumText('${widget.textFieldHeader}${widget.isCompulsory==true?"*":""}',color: widget.isEnabled==false?MyColor.disableColor:MyColor.colorBlack,fontSize: GetDimens.regularTextHeight,)),
                  SizedBox(height: ScreenSize().heightOnly(1.2),),
                ],
                Material(
                  color: const Color(MyColor.colorTransparent),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    splashColor: const Color(MyColor.colorSplash),
                    onTap: widget.onTap==true?(){
                      if(widget.showCalender==true)
                      {
                        //DateTime nowDate = DateTime.now();
                        // DatePicker.showDatePicker(context,
                        //     showTitleActions: true,
                        //     minTime: DateTime(widget.minYears?.year??1900, widget.minYears?.month??1, widget.minYears?.day??1),
                        //     maxTime: DateTime(widget.maxYears?.year??nowDate.year,widget.maxYears?.month??nowDate.month,widget.maxYears?.day??nowDate.day),
                        //     onChanged: (date) {
                        //       //print('change $date');
                        //     }, onConfirm: (date) {
                        //       setState(() {
                        //         widget.controller?.textEditingController.text = GetDateFormats().getDOBByDateTime(date)!;
                        //       });
                        //     }, currentTime: DateTime.now(), locale: LocaleType.en);
                      }
                    }:null,
                    child: Container(
                        height: ScreenSize().heightOnly(widget.height??7.0),
                        padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(widget.padding??4)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: widget.stroke??1,
                                color: Color(widget.isEnabled==false?MyColor.disableColor:data.hasFocus==true?MyColor.colorBlack:MyColor.colorBorder)
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(50))
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  key: widget.key,
                                  focusNode: widget.focusNode,
                                  controller: widget.controller?.textEditingController,
                                  cursorColor: Colors.black,
                                  onChanged: (text){
                                    //PrintLogs.print('textttt $text');
                                    if(widget.callBack!=null)
                                    {
                                      widget.callBack!(text);
                                    }
                                    if(widget.searchIcon==true)
                                    {
                                      if(text.isEmpty||text.length==1)
                                      {
                                        setState(() {

                                        });
                                      }
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: widget.icon!=null?Icon(widget.icon!,size: ScreenSize().heightOnly( 2.5),):null,
                                      suffixIcon: widget.suffixIcon!=null?Icon(widget.suffixIcon!,size: ScreenSize().heightOnly(3.5)):null,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      //contentPadding: widget.contentPadding,
                                      focusedErrorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      //label: Text(),
                                      hintText: widget.hintText,
                                      enabled: widget.onTap==true?false:widget.isEnabled??true,
                                      hintStyle: GetFont.get(
                                        context,
                                        fontSize:GetDimens.mediumTextHeight,
                                        fontWeight: FontWeight.w400,
                                        color: widget.isEnabled==false?MyColor.disableColor:MyColor.textHintColor,
                                      )
                                  ),
                                  //textAlignVertical: TextAlignVertical.top,
                                  maxLines: 1,
                                  obscureText: widget.isPasswordField==true?hideText:false,
                                  inputFormatters:
                                  widget.restrictionRegex!=null&&widget.isPhoneNumber==true?<TextInputFormatter>[
                                    CaseFormatting(),
                                    FilteringTextInputFormatter.allow(RegExp(widget.restrictionRegex!)),
                                    PhoneMaskedInputFormatter('000 00 000 0000')
                                  ]:
                                  widget.restrictionRegex!=null?<TextInputFormatter>[
                                    CaseFormatting(),
                                    FilteringTextInputFormatter.allow(RegExp(widget.restrictionRegex!))
                                  ]:<TextInputFormatter>[
                                    CaseFormatting(),
                                  ],
                                  textInputAction: widget.textInputAction??TextInputAction.done,
                                  autocorrect: true,
                                  autofocus: false,
                                  keyboardType: widget.textInputType??TextInputType.text,
                                  textAlign: TextAlign.start,

                                  style: GetFont.get(
                                    context,
                                    fontSize: GetDimens.mediumTextHeight,
                                    fontWeight: FontWeight.w400,
                                    textDecoration: TextDecoration.none,
                                    color: widget.isEnabled==false?MyColor.disableColor:MyColor.colorBlack,
                                  ),
                                ),
                              ),
                              if(widget.isPasswordField==true)...[
                                InkWell(
                                  child:Text(
                                    hideText?'Show':'Hide',
                                    style: GetFont.get(
                                        context,
                                        fontSize: 2.0,
                                        fontWeight: FontWeight.w400,
                                        color: MyColor.textHintColor
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      if(hideText) {
                                        hideText=false;
                                      } else {
                                        hideText=true;
                                      }
                                    });
                                  },
                                )
                              ],

                              if(widget.searchIcon==true)...[
                                if(widget.controller!=null&&widget.controller!.textEditingController.text.isNotEmpty)...[
                                  InkWell(
                                    onTap: (){
                                      widget.controller?.textEditingController.clear();
                                      data.notifyAll();
                                    },
                                    child: SvgPicture.string(
                                      SvgPicturesData.cross,
                                      height: ScreenSize().heightOnly(2.2),
                                      width: ScreenSize().heightOnly(2.2),
                                      color: const Color(MyColor.textHintColor),
                                    ),
                                  ),
                                ],
                                if(widget.controller!=null&&widget.controller!.textEditingController.text.isEmpty)...[
                                  SvgPicture.string(
                                    SvgPicturesData.searchIcon,
                                    height: ScreenSize().heightOnly(2.8),
                                    width: ScreenSize().heightOnly(2.8),
                                    color: const Color(MyColor.textHintColor),
                                  )
                                ],

                              ]
                            ],
                          ),
                        )
                    ),
                ),
                if(widget.errorText!=null&&widget.errorText!.isNotEmpty)...
                [
                  const DividerVertical(1),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.string(
                        SvgPicturesData.errorBlinkIcon,
                        height: ScreenSize().heightOnly(1.8),
                        width: ScreenSize().heightOnly(1.8),
                      ),
                      const DividerHorizontal(1),
                      Expanded(
                          child: Text(
                            widget.errorText??'',
                            style: GetFont.get(
                                context,
                                fontSize: 1.6,
                                color: MyColor.errorColor,
                                fontWeight: FontWeight.w400
                            ),
                          )
                      )
                    ],
                  ),
                ],
              ],
            ),
          );
        }
    );
  }
}

class TextFieldUiListener with ChangeNotifier
{
  bool? hasFocus;

  void updateFocus(bool bool) {
    hasFocus = bool;
    notifyListeners();
  }

  void notifyAll() {
    notifyListeners();
  }
}

class CaseFormatting extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text,
        selection: newValue.selection
    );
  }
}

