
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

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (_currentIndex < _imagePaths.length - 1) {
        _pageController.animateToPage(_currentIndex + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
      _startAutoSlide();
    });
  }

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
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      if(await SharedPreferenceService.getLoggedIn())
        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      else
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con)=>WelcomePage()));

    });
    _startAutoSlide();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80,),
            // SizedBox(height: 100,),
            Image.asset(
              "assets/images/logo.png",
              height: 150.0,
              width: 150.0,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),
                            Container(
                              color: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 80),
                                child: Text("Winable 11",
                                  style: GoogleFonts.lora(
                                    textStyle: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold)
                                  ),
                                ),
                            ),
                          ],
                        )
                      )
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: 20,),
            SizedBox(height: 30,),
            SizedBox(height: 30,),
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

