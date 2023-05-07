import 'package:recipley_assignment/BusinessLogicModel/Listeners/AuthenticationListener/login_authenticate_listener.dart';
import 'package:recipley_assignment/UIPages/SplashScreen/splash_screen.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipley_assignment/src/hide_keyboard.dart';
import 'package:provider/provider.dart';

import 'BusinessLogicModel/Listeners/AuthenticationListener/setting_listener.dart';
import 'BusinessLogicModel/Listeners/InternetListener/internet_listener.dart';
import 'UIPages/AuthenticationPages/login_page.dart';
import 'UIPages/MainHomePages/main_home_page.dart';
import 'UIPages/SplashScreen/setting_page.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GestureDetector(
      onTap: (){
        HideShowKeyboard.hide(context);
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginAuthenticateListener>(create: (_) => LoginAuthenticateListener(),),
          ChangeNotifierProvider<CheckInternetConnection>(create: (_) => CheckInternetConnection()),
          ChangeNotifierProvider<SettingListener>(create: (_) => SettingListener())
        ],
        child: AfterLocale()
      ),
    );
  }
}
class AfterLocale extends StatefulWidget {
  const AfterLocale({Key? key}) : super(key: key);

  @override
  State<AfterLocale> createState() => _AfterLocaleState();
}

class _AfterLocaleState extends State<AfterLocale> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GetNavigatorStateContext.navigatorKey,
      scaffoldMessengerKey: GetNavigatorStateContext.rootScaffoldMessengerKey,
      title: 'Recipley',
      color: const Color(MyColor.colorWhite),
      theme: ThemeData(
        primaryColor: const Color(MyColor.colorPrimary),
        primaryColorDark: const Color(MyColor.colorPrimary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Color(MyColor.colorWhite)).copyWith(secondary: const Color(MyColor.colorPrimary)),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes:<String, WidgetBuilder> {
        '/':(BuildContext context) => MyHomePage(),
        CurrentPage.LoginPage: (context) => LoginPage(),
        CurrentPage.MainHomePage: (context) => MainHomePage(),
        CurrentPage.SettingPage: (context) => SettingPage(),
        // CurrentPage.MyProfilePage: (context) => MyProfilePage(),
        // CurrentPage.MyProfilePage: (context) => MyProfilePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //UserInfoPrefs().removeUserInfoPrefs();
      Provider.of<CheckInternetConnection>(context,listen: false).initConnectivity();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
class GetNavigatorStateContext {
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

