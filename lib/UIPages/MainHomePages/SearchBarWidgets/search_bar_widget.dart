import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/Listeners/MainHomePageListener/home_page_food_data_listener.dart';
import 'package:recipley_assignment/Packages/SearchTextField/UI/search_widget.dart';
import 'package:recipley_assignment/UIPages/MainHomePages/SearchBarWidgets/search_filter_ui.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/bold_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/get_icons.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/fonts.dart';

import '../../../BusinessLogicModel/Listeners/MainHomePageListener/FilterListeners/filter_listener.dart';
import '../../../src/icons.dart';
import '../../../src/screen_sizes.dart';
import '../../ReUseWidgets/BottomSheetUi/bottom_sheet_ui.dart';
import '../../ReUseWidgets/TextFields/text_field.dart';

class SearchWidget extends StatelessWidget {
  Function()? filterTap;
  Function(String) textCallBack;
  SearchWidget({this.filterTap,required this.textCallBack,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenSize().widthOnly(6),0,ScreenSize().widthOnly(6),ScreenSize().heightOnly(2)),
      child: Row(
        children: [
          Expanded(child: SearchBarWidget(textCallBack: textCallBack)),
          const DividerHorizontal(2),
          Consumer<FoodDataListener>(
            builder: (context, data, child) {
              return Stack(
                children: [
                  FilterIcon(
                    onTap: (){
                    ShowBottomSheet.show(
                        context,
                        height: 90,
                        optionalDefaultAppBarText: 'Select Filters',
                        body: ChangeNotifierProvider<FilterListener>(
                            create: (_) => FilterListener(appliedFilters: data.appliedFilters),
                            builder: (context, snapshot) {
                              return FilterUi();
                            }
                        ),
                        callBack: (value){
                          data.selectedFilters(value);
                        }
                    );
                  },
                    totalFilters: data.totalFilters,
                  ),
                ],
              );
            }
          )
        ],
      ),
    );
  }
}
class FilterIcon extends StatelessWidget {
  final Function()? onTap;
  final String? totalFilters;
  const FilterIcon({this.onTap,this.totalFilters, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = ScreenSize().heightOnly(7.8);

    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Material(
                color: const Color(MyColor.colorPrimary),
                child: InkWell(
                  onTap: onTap,
                  splashColor: const Color(MyColor.colorSplash),
                  child: SizedBox(
                    height: size/100*80,
                    width: size/100*80,
                    child:
                    Center(
                      child: SvgPicture.string(
                        SvgPicturesData.filter,
                        height: size/100*30,
                        width: size/100*30,
                        color: const Color(MyColor.colorBlack),
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
          if(totalFilters!=null)...[
            Align(
              alignment: Alignment.topRight,
              child: ClipOval(
                child: Material(
                  color: const Color(MyColor.colorBlack),
                  child: Container(
                    height: ScreenSize().heightOnly(2.4),
                    alignment: Alignment.center,
                    width: ScreenSize().heightOnly(2.4),
                    child: Padding(
                        padding: EdgeInsets.all(ScreenSize().heightOnly(0.4)),
                        child: BoldText(
                          totalFilters??'0',
                          fontSize: 0.9,
                          color: MyColor.colorWhite,
                        )

                    ),
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
