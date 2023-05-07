import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Decorations/dimens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/bold_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/medium_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/TextWidgets/regular_text.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/default_circular_progress_indicator.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';

import '../../../BusinessLogicModel/Enums/apistatus_anum.dart';
import '../../../BusinessLogicModel/Listeners/MainHomePageListener/FilterListeners/filter_listener.dart';
import '../../../src/map_index.dart';
import '../../ReUseWidgets/Buttons/bottom_twin_buttons.dart';

class FilterUi extends StatefulWidget {
  const FilterUi({Key? key}) : super(key: key);

  @override
  State<FilterUi> createState() => _FilterUiState();
}

class _FilterUiState extends State<FilterUi> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FilterListener>(context,listen: false).start(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterListener>(
      builder: (context, data, child) {
        if(data.apiStatus == ApiStatus.done)
          {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DividerVertical(4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(6)),
                  child: MediumText('Catgeory',),
                ),
                const DividerVertical(1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(3)),
                  child: Wrap(
                      direction: Axis.horizontal,
                      children: GetMapIndex.mapIndexed(data.allFilters!.category!, (index, item) =>
                          SelectedWidget(
                            item.name,
                            selected: data.appliedFilters?.category?[index].selected==true?true:false,
                            onTap: (){
                        data.selectedFilterFromCategory(index);
                      },)).toList()
                  ),
                ),
                const DividerVertical(4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(6)),
                  child: MediumText('Cuisine'),
                ),
                const DividerVertical(1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(3)),
                  child: Wrap(
                      direction: Axis.horizontal,
                      children: GetMapIndex.mapIndexed(data.allFilters!.cuisine!, (index, item) =>
                          SelectedWidget(
                            item.name,
                            selected: data.appliedFilters?.cuisine?[index].selected==true?true:false,
                            onTap: (){
                        data.selectedFilterFromCuisine(index);
                      },)).toList()
                  ),
                ),
                Expanded(child: Container()),
                BottomTwinButtons(
                  acceptCallBack: () { data.applyFilters(context); },
                  rejectCallBack: () { data.clearAll(context); },
                  acceptText: 'Apply',
                  rejectText: 'Clear All',
                )
              ],
            );
          }
        else
          {
            return DefaultCircularProgress();
          }
      }
    );
  }
}
class SelectedWidget extends StatelessWidget {
  final String text;
  final bool? selected;
  final Function()? onTap;
  const SelectedWidget(this.text, {this.onTap,this.selected,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize().widthOnly(2),vertical: ScreenSize().heightOnly(1.2)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Material(
          color: Color(selected == true?MyColor.colorPrimary:MyColor.colorPrimaryExtra),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize().heightOnly(2),vertical: ScreenSize().heightOnly(1.0)),
              child: RegularText(text),
            )
        ),
      ),
    );
  }
}
