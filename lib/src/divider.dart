import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:flutter/material.dart';

class DividerVertical extends StatelessWidget {
  final double? size;
  const DividerVertical(this.size,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenSize().heightOnly(size??2),);
  }
}
class DividerHorizontal extends StatelessWidget {
  final double? size;
  const DividerHorizontal(this.size,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: ScreenSize().widthOnly(size??2),);
  }
}
class DividerHorizontalByHeight extends StatelessWidget {
  final double? size;
  const DividerHorizontalByHeight(this.size,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: ScreenSize().heightOnly(size??2),);
  }
}
