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
