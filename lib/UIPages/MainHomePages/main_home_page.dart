import 'package:provider/provider.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/AppBars/default_app_bar_widget.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/Default_Screens/default_screens.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/NotAvailableText/not_available_text.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/divider.dart';
import 'package:recipley_assignment/src/icons.dart';
import 'package:recipley_assignment/src/lottie_files.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:recipley_assignment/src/strings.dart';

import '../../BusinessLogicModel/Listeners/MainHomePageListener/home_page_food_data_listener.dart';
import '../ReUseWidgets/default_circular_progress_indicator.dart';
import 'ExtraWidgets/log_out_button.dart';
import 'HomePageWidgets/home_page_list_widget.dart';
import 'SearchBarWidgets/search_bar_widget.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodDataListener>(create: (_) => FoodDataListener()),
      ],
      builder: (context, snapshot) {
        return GetPageStarterScaffold(
            appBar: AppBarWidget(title: 'Home Page',actions: LogOutButton(),),
            bottomAppBar: PreferredSize(
              preferredSize: Size(ScreenSize().widthOnly(100),ScreenSize().heightOnly(10)),
              child: SearchWidget(
                  textCallBack: (value){
                    Provider.of<FoodDataListener>(context,listen: false).searchViaText(value);
                  }
              ),
            ),
            //withScrollView: true,
            body: BodyData()
        );
      }
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodDataListener>(context,listen: false).start(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodDataListener>(
      builder: (context, data, child) {
        if(data.apiStatus == ApiStatus.done)
          {
            return ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(ScreenSize().widthOnly(6), ScreenSize().heightOnly(3), ScreenSize().widthOnly(6), ScreenSize().heightOnly(10)),
                itemBuilder: (context,index){
                  return HomePageListWidget(data.filteredListData![index]);
                },
                separatorBuilder: (context,index){
                  return const DividerVertical(3);
                },
                itemCount: data.filteredListData?.length??0
            );
          }
        else if(data.apiStatus == ApiStatus.empty)
        {
          return SingleChildScrollView(child: NotAvailableView(header: GetVariable.foodHeader,text: GetVariable.foodEmpty,icon: LottieString.empty,marginTop: 4,));
        }
        else if(data.apiStatus == ApiStatus.error)
        {
          return SingleChildScrollView(child: NotAvailableView(header: GetVariable.errorHeader,text: GetVariable.errorValue,icon: LottieString.restInPeace,marginTop: 4,));
        }
        else
          {
            return SingleChildScrollView(child: Padding(
              padding: EdgeInsets.only(top: ScreenSize().heightOnly(10)),
              child: DefaultCircularProgress(),
            ));
          }
      }
    );
  }
}
