import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/fonts.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class NoInternetJustAnim extends StatefulWidget {
  double? height,width,margin;
  String? header;
  NoInternetJustAnim(this.header,{Key? key,this.height,this.width,this.margin}) : super(key: key);

  @override
  State<NoInternetJustAnim> createState() => _NoInternetJustAnimState();
}

class _NoInternetJustAnimState extends State<NoInternetJustAnim> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenSize().heightOnly( widget.margin??0),),
        Lottie.asset(
          "assets/no_internet.json",
          controller: _controller,
          height: ScreenSize().heightOnly( widget.height??18),width: ScreenSize().heightOnly(
            widget.width??18),
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller
              ..duration = composition.duration
              ..forward();
            _controller.repeat();
          },
          repeat: true,
        ),
        SizedBox(height: ScreenSize().heightOnly( 2),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(8.6)),
          child: Text(
            '${widget.header}',
            style: GetFont.get(
                context,
                fontWeight: FontWeight.w400,
                fontSize: 1.6,
                color: MyColor.colorBlack
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: ScreenSize().heightOnly( 2),),

      ],
    );
  }
}
