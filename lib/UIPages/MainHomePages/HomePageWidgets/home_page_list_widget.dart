import 'package:flutter/material.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/FoodModel/food_model.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/get_icons.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/image_getter.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

class HomePageListWidget extends StatelessWidget {
  final FoodData data;
  const HomePageListWidget(this.data, {Key? key}) : super(key: key);

  final double borderRadius = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().heightOnly(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Color(MyColor.colorPrimaryExtra)
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenSize().heightOnly(2)),
        child: Row(
          children: [
            GetNetWorkImage(image: data.image??'',radius: borderRadius,size: 12,boxShape: BoxShape.rectangle,vintageImage: true,),
            const DividerHorizontal(4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MediumText(data.name,fontSize: 1.8,),
                  const DividerVertical(1),
                  Row(
                    children: [
                      GetNetWorkImage(image: 'https://img.freepik.com/free-photo/portrait-smiling-chef-uniform_329181-675.jpg?size=626&ext=jpg&ga=GA1.1.1841458457.1680781265&semt=sph',size: 3,vintageImage: true,),
                      const DividerHorizontal(2),
                      RegularText(data.chef??'Abdul Muneeb',fontSize: GetDimens.smallTextHeight,),
                    ],
                  )
                ],
              ),
            ),
            GetIcons(icon: SvgPicturesData.rightArrow,backgroundColor: MyColor.colorBlack,iconColor: MyColor.colorWhite,radius: 12,size: 2.2,)
          ],
        ),
      ),
    );
  }
}
