
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsports/constance/constance.dart' as constance;
import 'package:newsports/modules/welcome/welcome_page.dart';

import '../../Language/LanguageData.dart';
import '../../main.dart';
import '../../utils/shared_preference_services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _imagePaths = List.generate(10, (index) => "assets/images/${index+1}.png");



  late BuildContext myContext;

  _loadNextScreen() async {

    if (!mounted) return;
    constance.allTextData = AllTextData.fromJson(
      json.decode(
        await DefaultAssetBundle.of(myContext).loadString("jsonFile/languagetext.json"),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    myContext = context;
    _loadNextScreen();
    _setOnBoarding();
    super.initState();
  }

  _setOnBoarding() async{
    await SharedPreferenceService.setOnBoarding(true);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _imagePaths[index],
                  fit: BoxFit.fitWidth,
                  height: double.infinity,
                );
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>WelcomePage()));
                    },
                    child: Text(_currentIndex == _imagePaths.length -1?'Next':'Skip')),
              ),
            ),

          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _imagePaths.length; i++) {
      list.add(i == _currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

