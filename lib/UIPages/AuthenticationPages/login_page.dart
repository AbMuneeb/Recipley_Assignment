import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/login_authenticate_listener.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/VibratorListener/vibrator_listener.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_request_model.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/AppBars/default_app_bar_widget.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Buttons/buttons.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Default_Screens/default_screens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextFields/text_field.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/bold_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/image_getter.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:recipley_assignment/src/snackbar_design.dart';

import '../../src/pages_name.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPageStarterScaffold(
      appBar: AppBarWidget(),
      withScrollView: true,
      body: BodyData()
    );
  }
}
class BodyData extends StatefulWidget {
  const BodyData({Key? key}) : super(key: key);

  @override
  State<BodyData> createState() => _BodyDataState();
}

class _BodyDataState extends State<BodyData> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginAuthenticateListener>(
      builder: (context, data, child) {

        return SizedBox(
          width: double.infinity,
          height: ScreenSize().heightOnly(100),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DividerVertical(6),
                  // Padding(
                  //   padding: GetDimens.horizontalPadding,
                  //   child: BoldText('Welcome to',fontSize: 3.0,),
                  // ),
                  Padding(
                    padding: GetDimens.horizontalPadding,
                    child: BoldText(
                      'Login',
                      fontSize: 4.4,
                    )
                  ),
                  const DividerVertical(4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(7.5)),
                    child: RichText(
                      text: TextSpan(
                        text: 'Hey Buddy, ',
                        style: GetFont.get(
                            context,
                          fontSize: GetDimens.regularTextHeight,
                          color: MyColor.colorBlack,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Please login using your credentials',
                            style: GetFont.get(
                              context,
                              fontSize: GetDimens.regularTextHeight,
                              color: MyColor.colorBlack,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // const DividerVertical(4),
                  // MediumText('Work without limits',fontSize: GetDimens.bigTextHeight,),
                  const DividerVertical(8),
                  TextWidget(data.emailController,TextInputAction.next,data.emailFocus, const Key('Email'),'enter email address',callBack: response,textInputType: TextInputType.emailAddress, textFieldHeader: 'Email address',isCompulsory: true,margin: 7,),
                  const DividerVertical(4),
                  TextWidget(data.passwordController,TextInputAction.done,data.passFocus, const Key('Password'),'enter your password',callBack: response,textInputType: TextInputType.text,textFieldHeader: 'Password',margin: 7,isCompulsory: true,isPasswordField: true,),
                  const DividerVertical(8),
                  ButtonWidget(text: 'Sign in',buttonColor: MyColor.colorPrimary,textSize: 2.2,textColor: MyColor.colorBlack,height: 7.5,paddingHorizontal: ScreenSize().heightOnly(1.2),weight: FontWeight.w600,onPressed: confirmPressed,margin: 16,elevation: 16,),
                  //const DividerVertical(5),
                  // RegularText('OR'),
                  // const DividerVertical(3),
                  // InkWell(
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  //     onTap: signUpClick,
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(1),vertical: ScreenSize().heightOnly(0.8)),
                  //       child: MediumText('Click to Sign Up'),
                  //     )),
                  const DividerVertical(10),
                ],
              ),

            ],
          ),
        );
      }
    );
  }

  signUpClick()
  {
    Navigator.pushNamed(context, CurrentPage.SignUp);
  }
  void confirmPressed()
  {
    LoginAuthenticateListener loginNotifier = Provider.of<LoginAuthenticateListener>(context,listen: false);
    if(loginNotifier.emailController.textEditingController.text.isNotEmpty&&loginNotifier.passwordController.textEditingController.text.isNotEmpty)
      {
        loginNotifier.start(
            context,
            LoginRequestModel(
              email: loginNotifier.emailController.textEditingController.text,
              password: loginNotifier.passwordController.textEditingController.text,
              returnSecureToken: true
            )
        );
      }
    else
      {
        Vibrator.errorVibrate();
        if(loginNotifier.emailController.textEditingController.text.isEmpty)
          {
            SnackBarDesign.errorSnack('Email/Username field can not be empty');
          }
        else if(loginNotifier.passwordController.textEditingController.text.isEmpty)
        {
          SnackBarDesign.errorSnack('Password field can not be empty');
        }
      }
  }
  response(String value) {
  }
}

