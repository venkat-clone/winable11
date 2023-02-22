// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';

class CricketPage extends StatefulWidget {
  @override
  _CricketPageState createState() => _CricketPageState();
}

class _CricketPageState extends State<CricketPage> {
  final List<String> imgList = [
    ConstanceData.slider1,
    ConstanceData.slider2,
    ConstanceData.slider3,
    ConstanceData.slider4,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ConstanceData.palyerProfilePic,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of('My Matches'),
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 18,
                                    ),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                AppLocalizations.of('View All'),
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Mumbai Indians'),
                      txt3: AppLocalizations.of('Kolkata'),
                      txt4: "MI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "KOL",
                      txt7: AppLocalizations.of('1 Team'),
                      image1: Image.asset(
                        ConstanceData.mumbaiIndians,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.kolkata,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 180,
                child: CarouselSlider(
                  items: imgList
                      .map(
                        (item) => Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                child: Text(
                  AppLocalizations.of('Upcoming Matches'),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        fontSize: 18,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Mumbai Indians'),
                      txt3: AppLocalizations.of('Kolkata'),
                      txt4: "MI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "KOL",
                      txt7: AppLocalizations.of('1 Team'),
                      image1: Image.asset(
                        ConstanceData.mumbaiIndians,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.kolkata,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Delhi Capital'),
                      txt3: AppLocalizations.of('Hyderabad'),
                      txt4: "DC",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30 * 30,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "HD",
                      txt7: AppLocalizations.of('1 Team'),
                      image1: Image.asset(
                        ConstanceData.delhiCapital,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.hyderabad,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Channai'),
                      txt3: AppLocalizations.of('Banglore'),
                      txt4: "BT",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 90 * 90,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "BG",
                      txt7: AppLocalizations.of('1 Team'),
                      image1: Image.asset(
                        ConstanceData.channai,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.banglore,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Mumbai Indians'),
                      txt3: AppLocalizations.of('Delhi Capital'),
                      txt4: "MI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 180 * 30,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "DC",
                      txt7: AppLocalizations.of('1 Team'),
                      image1: Image.asset(
                        ConstanceData.mumbaiIndians,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.delhiCapital,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
