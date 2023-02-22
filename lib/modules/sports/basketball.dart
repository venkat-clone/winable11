// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';

class BasketballPage extends StatefulWidget {
  @override
  _BasketballPageState createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  final List<String> imgList = [
    ConstanceData.bslider1,
    ConstanceData.bslider2,
    ConstanceData.bslider3,
    ConstanceData.bslider6,
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
                      height: 200),
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
                      txt1: AppLocalizations.of('CBA League 2020-21'),
                      txt2: AppLocalizations.of('Jiangsu Dragons'),
                      txt3: AppLocalizations.of('Zhejiang Golden Bulls'),
                      txt4: "JD",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 20 * 20,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "ZGB",
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
                      txt1: AppLocalizations.of('CBA League 2020-21'),
                      txt2: AppLocalizations.of('Qingdo Eagles'),
                      txt3: AppLocalizations.of('Guangdong Southern Tigers'),
                      txt4: "QE",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 140 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "GST",
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
                      txt1: AppLocalizations.of('CBA League 2020-21'),
                      txt2: AppLocalizations.of('Andorra'),
                      txt3: AppLocalizations.of('Burgos'),
                      txt4: "AR",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 160 * 160,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "BGL",
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
                      txt1: AppLocalizations.of('Spanish Liga ACB'),
                      txt2: AppLocalizations.of('Jiangsu Dragons'),
                      txt3: AppLocalizations.of('Zhejiang Golden Bulls'),
                      txt4: "JD",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 70 * 60,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      txt6: "ZGB",
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
