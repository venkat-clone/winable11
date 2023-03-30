// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/MatchModel.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';
import '../../controllers/MatchController.dart';
import '../../models/Team.dart';

class FootballPage extends StatefulWidget {
  MatchController controller;
  FootballPage({required this.controller});
  @override
  _FootballPageState createState() => _FootballPageState(controller);
}

class _FootballPageState extends StateMVC<FootballPage> {
  final List<String> imgList = [
    ConstanceData.fslider1,
    ConstanceData.fslider2,
    ConstanceData.fslider3,
    ConstanceData.fslider4,
  ];
  late MatchController _con;
  final scrollController = ScrollController();
  _FootballPageState(MatchController cont) : super(cont) {
    _con = controller as MatchController;
  }
  @override
  void initState() {
    initAsync();
    super.initState();
  }
  @override
  Future<bool> initAsync() {
    _con.initSport();
    _con.getUpComingFootBallMatches(context);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {

    if(_con.upcomingFootballMatchList.loading){
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_con.upcomingFootballMatchList.error != null){
      return Expanded(
        child: Center(
          child: Text(_con.upcomingFootballMatchList.error!),
        ),
      );
    }

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
              _con.upcomingFootballMatchList.value!.length > 0
                  ? ListView.separated(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: _con.upcomingFootballMatchList.value!.length,
                itemBuilder: (c, index) {
                  final match = _con.upcomingFootballMatchList.value![index];
                  return CardView(
                    match: match,
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) => SizedBox(
                  height: 15,
                ),
              )
                  : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "No  Matches for the sport",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
