// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:newsports/Language/LanguageData.dart';
import 'package:flutter/material.dart';
import 'package:newsports/constance/constance.dart' as constance;

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
        await DefaultAssetBundle.of(myContext)
            .loadString("jsonFile/languagetext.json"),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    myContext = context;
    _loadNextScreen();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      // if(await SharedPreferenceService.getLoggedIn())
      //   Navigator.of(context).pushReplacementNamed(Routes.HOME);
      // else
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (con) => WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Image.asset(
          "assets/img/logo.png",
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
