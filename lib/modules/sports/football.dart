// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';

class FootballPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  final List<String> imgList = [
    ConstanceData.fslider1,
    ConstanceData.fslider2,
    ConstanceData.fslider3,
    ConstanceData.fslider4,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      txt1: AppLocalizations.of('Korean League'),
                      txt2: AppLocalizations.of('Sangju Sangmu'),
                      txt3: "Daegu FC",
                      txt4: "MSSMGI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 200 * 200,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "DAE",
                      txt7: AppLocalizations.of('₹5 Lakhs'),
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
                      txt1: AppLocalizations.of('Korean League'),
                      txt2: AppLocalizations.of('Seongam FC'),
                      txt3: AppLocalizations.of('Everton'),
                      txt4: "ET",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 70 * 120,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "SEGN",
                      txt7: AppLocalizations.of('₹5 Lakhs'),
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
                      txt1: AppLocalizations.of('Korean League'),
                      txt2: "FC Seaul",
                      txt3: AppLocalizations.of('Liverpool'),
                      txt4: "SE",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 100 * 20,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "LP",
                      txt7: AppLocalizations.of('₹5 Lakhs'),
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
                      txt1: AppLocalizations.of('Korean League'),
                      txt2: AppLocalizations.of('Sangju Sangmu'),
                      txt3: "Daegu FC",
                      txt4: "MSSMGI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 130 * 150,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "DAE",
                      txt7: AppLocalizations.of('₹5 Lakhs'),
                      image1: Image.asset(
                        ConstanceData.mumbaiIndians,
                        fit: BoxFit.cover,
                      ),
                      image2: Image.asset(
                        ConstanceData.kolkata,
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
