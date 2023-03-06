import 'package:firebase_core/firebase_core.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/constance/themes.dart';
import 'package:newsports/modules/home/home.dart';
import 'package:newsports/modules/login/loginPage.dart';
import 'package:newsports/modules/register/registerPage.dart';
import 'package:newsports/modules/splash/spalshPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsports/constance/constance.dart' as constance;

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  static setCustomeLanguage(BuildContext context, String languageCode) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLanguage(languageCode);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        constance.primaryColorString =
            ConstanceData().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  String locale = "en";

  setLanguage(String languageCode) {
    setState(() {
      locale = languageCode;
      constance.locale = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    constance.locale = locale;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
      statusBarBrightness:
          AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          AppTheme.isLightTheme ? Colors.white : Colors.black,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness:
          AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
    ));
    return MaterialApp(
      title: 'Winable 11',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      initialRoute: Routes.SPLASH,
      routes: routes,
    );
  }

  var routes = <String, WidgetBuilder>{
    // Routes.SPLASH: (BuildContext context) => OnboardingScreen(),
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.LOGIN: (BuildContext context) => LoginScreen(),
    Routes.REGISTER: (BuildContext context) => RegisterPage(),
    Routes.HOME: (BuildContext context) => HomeScreen(),
  };
}

class Routes {
  static const String SPLASH = "/";
  static const String LOGIN = "/login";
  static const String REGISTER = "/register";
  static const String HOME = "/home";
}
