// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:newsports/Language/LanguageData.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/main.dart';
import 'package:newsports/modules/referralCode/referralCode.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:newsports/constance/constance.dart' as constance;

import '../../utils/shared_preference_services.dart';
import '../../utils/value_notifiers.dart';
import '../welcome/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late BuildContext myContext;

  _loadNextScreen() async {

    if (!mounted) return;
    constance.allTextData = AllTextData.fromJson(
      json.decode(
        await DefaultAssetBundle.of(myContext).loadString("jsonFile/languagetext.json"),
      ),
    );

  }

  @override
  void initState() {
    myContext = context;
    _loadNextScreen();

    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {

      final onboarding = await SharedPreferenceService.getOnBoarding();
      if(!onboarding){
        Navigator.of(context).pushReplacementNamed(Routes.OnBoarding);
        return;
      }


      final isLongedIn =await SharedPreferenceService.getLoggedIn();

      if(!isLongedIn) {
        await SharedPreferenceService.initSharedPreferences(login: false);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (con) => WelcomePage()));
      } else {
        await initValueNotifiers();
        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child:Image.asset(ConstanceData.appLogo,
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}
