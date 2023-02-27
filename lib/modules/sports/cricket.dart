// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/MatchController.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';

class CricketPage extends StatefulWidget {
  @override
  _CricketPageState createState() => _CricketPageState();
}

class _CricketPageState extends StateMVC<CricketPage> {
  final List<String> imgList = [
    ConstanceData.slider1,
    ConstanceData.slider2,
    ConstanceData.slider3,
    ConstanceData.slider4,
  ];

  late MatchController _con ;
  final scrollController  = ScrollController();
  _CricketPageState():super(MatchController()){
    _con = controller as MatchController;
  }


  @override
  void initState() {
    super.initState();
    _con.getMatches(context);
    _con.getTeams(context);
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

                    // InkWell(
                    //   onTap:(){
                    //     _con.getMatches(context);
                    //     _con.getTeams(context);
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     width: 100,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    Scrollbar(
                      controller :scrollController,
                      isAlwaysShown: true,
                      child: ListView.separated(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: _con.matchList.length,
                          itemBuilder: (c,index){
                          final match = _con.matchList[index];
                          final teamA = _con.teams[match.teamid1];
                          final teamB = _con.teams[match.teamid2];
                            return CardView(
                              txt1: AppLocalizations.of(match.title),
                              txt2: AppLocalizations.of(teamA?.teamName??""),
                              txt3: AppLocalizations.of(teamB?.teamName??""),
                              txt4: teamA?.teamShortName??"",
                              // setTime: CountdownTimer(
                              //   endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
                              //   textStyle: TextStyle(
                              //     fontSize: 14,
                              //     color: Colors.red,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              setTime: Text(match.matchDateTime,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                              ),
                              txt6: teamB?.teamShortName??"",
                              txt7: AppLocalizations.of('1 Team'),
                              image1: Image.network(
                                teamA?.teamImage??"",
                                fit: BoxFit.cover,
                              ),
                              image2: Image.network(
                                teamB?.teamImage??"",
                                fit: BoxFit.cover,
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) =>SizedBox(
                        height: 15,
                      ),
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
