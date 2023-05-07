import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

import 'lottie_files.dart';

class ShowLoaderPopUp
{
  static showExtra(BuildContext context, StreamController<bool> loadingStream)
  {
    showDialog(context: context,barrierColor: const Color(MyColor.colorWhite).withOpacity(0.9),builder: (BuildContext dialogContext)=> LoaderPopUp(dialogContext,loadingStream: loadingStream,));
  }
}
class LoaderPopUp extends StatefulWidget {
  BuildContext dialogContext;
  StreamController<bool>? loadingStream;
  LoaderPopUp(this.dialogContext,{Key? key, this.loadingStream}) : super(key: key);

  @override
  _LoaderPopUpState createState() => _LoaderPopUpState();
}

class _LoaderPopUpState extends State<LoaderPopUp> with TickerProviderStateMixin{

  dynamic animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.loadingStream!.isClosed==false)
    {
      widget.loadingStream!.stream.listen((event) {
       // print('listenedddddd');
        try{
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context).pop();
          });
        }catch(e){
         // print('comed ${e.toString()}');
        }
      });
    }
    else
      {
        print('not listenedddddd');

      }

    return Material(
      color: const Color(MyColor.colorTransparent),
      child: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: LayoutBuilder(
          builder: (context,constraints)
          {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Center(child: Lottie.asset(LottieString.loaderAnim,
                  controller: animationController,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    animationController!
                      ..duration = composition.duration
                      ..forward();
                    animationController!.repeat();
                  },
                  fit: BoxFit.fitWidth,height: ScreenSize().heightOnly(30),width: ScreenSize().heightOnly(30),repeat: true))

            );
          },
        ),
      ),
    );
  }
}