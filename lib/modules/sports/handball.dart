// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../constance/constance.dart';

class HandballPage extends StatefulWidget {
  @override
  _HandballPageState createState() => _HandballPageState();
}

class _HandballPageState extends State<HandballPage> {
  final List<String> imgList = [
    ConstanceData.hslider1,
    ConstanceData.hslider2,
    ConstanceData.hslider3,
    ConstanceData.hslider4,
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
                      txt1: AppLocalizations.of('German Mens Handball'),
                      txt2: AppLocalizations.of('MT Melsungen'),
                      txt3: AppLocalizations.of('TSV GWD Minden'),
                      txt4: "MM",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 600 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "GWD",
                      txt7: AppLocalizations.of('₹1 Lakhs'),
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
                      txt1: AppLocalizations.of('German Mens Handball'),
                      txt2: "THW- Kiel",
                      txt3: AppLocalizations.of('SG Flensburg-Handewitt'),
                      txt4: "KIE",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 90 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "SFH",
                      txt7: AppLocalizations.of('₹1 Lakhs'),
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
                      txt1: AppLocalizations.of('German Mens Handball'),
                      txt2: AppLocalizations.of('Frisch Auf Goppingen'),
                      txt3: AppLocalizations.of('HC Eriangen'),
                      txt4: "FAG",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 300 * 160,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "HCE",
                      txt7: AppLocalizations.of('₹1 Lakhs'),
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
                      txt1: AppLocalizations.of('German Mens Handball'),
                      txt2: "MT Melsungen",
                      txt3: AppLocalizations.of('TSV GWD Minden'),
                      txt4: "MM",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 400 * 30,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "GWD",
                      txt7: AppLocalizations.of('₹1 Lakhs'),
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
