import 'package:flutter/material.dart';

import '../../Language/appLocalizations.dart';
import '../../constance/constance.dart';
import '../../main.dart';
import '../../widget/customButton.dart';
import '../referralCode/referralCode.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _imagePaths = List.generate(10, (index) => "assets/images/${index+1}.png");
  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      if (_currentIndex < _imagePaths.length - 1) {
        _pageController.animateToPage(_currentIndex + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoSlide();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.of('Play Your Own Sport'),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Expanded(
            //   child: Container(
            //     child: Image.asset(
            //       ConstanceData.batsmanLogo,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
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
                  return Container(
                    width: 10,
                    child: Image.asset(
                      _imagePaths[index],
                      fit: BoxFit.cover,
                      width: 10,
                      // width: MediaQuery.of(context).size.width*0.6,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomButton(
                text: AppLocalizations.of('Register'),
                onTap: () {
                  Navigator.pushNamed(context, Routes.REGISTER);
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomButtonBorder(
                text: AppLocalizations.of("Let's Play"),
                onTap: () {
                  Navigator.pushNamed(context, Routes.LOGIN);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            rowText(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget rowText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of('Invited by a friend'),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                  letterSpacing: 0.6,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                AppLocalizations.of('Already a user?'),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReferralCodePage(),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of('Enter code'),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.LOGIN);
                },
                child: Text(
                  AppLocalizations.of('Log In'),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              )
            ],
          )
        ],
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
        color: isActive ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

}
