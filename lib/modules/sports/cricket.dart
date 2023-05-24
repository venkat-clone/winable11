// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/MatchController.dart';
import 'package:newsports/models/MatchModel.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../constance/constance.dart';
import '../navigationBar/myMatches/myMatches.dart';
import '../register/passwordReset.dart';
import '../register/registerPage.dart';
import '../welcome/feature_page.dart';

class CricketPage extends StatefulWidget {
  MatchController controller;
  CricketPage({required this.controller});
  @override
  _CricketPageState createState() => _CricketPageState(controller);
}

class _CricketPageState extends StateMVC<CricketPage> {


  late MatchController _con;
  final scrollController = ScrollController();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  _CricketPageState(MatchController cont) : super(cont) {
    _con = controller as MatchController;
  }

  @override
  void initState() {
    super.initState();
    // _con.getCricketMatches(context);
    if(_con.upcomingCricketMatchList.value==null){
      _con.getUpcomingCricketMatches(context);
      _con.getMyLiveCricketMatches(context);
    }

     // _con.getTeams(context);
  }
  void _onLoading() async{
    await _con.getUpcomingCricketMatches(context);
    await _con.getMyLiveCricketMatches(context);
    setState(() {
      _refreshController.loadComplete();
      _refreshController.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_con.upcomingCricketMatchList.loading){
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_con.upcomingCricketMatchList.error != null){
      return Flexible(
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          onLoading: _onLoading,
          onRefresh: _onLoading,
          child: Center(
              child: Text(_con.upcomingCricketMatchList.error!)),
        ),
      );
    }


    return Flexible(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onLoading: _onLoading,
        onRefresh: _onLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            if(kDebugMode)
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c)=>PasswordReset()));
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.amber,

                ),
              ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(_con.myLiveCricketMatchList.value!=null)
                  Stack(
                  children: [
                    Container(

                      height: 200,
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
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of('Matches'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 18,
                                      ),
                                ),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyMatchesPage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of('View All'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: CarouselSlider(
                        items: _con.myLiveCricketMatchList.value!
                            .map((item) => LiveSliderCardView(match: item),)
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          height: 230,
                        ),
                      ),
                    ),

                  ],
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // SizedBox(
                //   height: 180,
                //   child: CarouselSlider(
                //     items: imgList
                //         .map(
                //           (item) => Image.asset(
                //             item,
                //             fit: BoxFit.cover,
                //           ),
                //         )
                //         .toList(),
                //     options: CarouselOptions(
                //       aspectRatio: 16 / 9,
                //       viewportFraction: 0.8,
                //       initialPage: 0,
                //       autoPlay: true,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enlargeCenterPage: true,
                //       scrollDirection: Axis.horizontal,
                //       height: 200,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 0),
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
                      _con.upcomingCricketMatchList.value!.length > 0
                          ? ListView.separated(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: _con.upcomingCricketMatchList.value!.length,
                            itemBuilder: (c, index) {
                              final match = _con.upcomingCricketMatchList.value![index];
                              final dateTime = DateTime.parse(match.matchDateTime);
                              final _timeLeft = dateTime.difference(DateTime.now());
                              // if(_timeLeft.isNegative) return SizedBox();
                              return CardView(match: match);
                            },
                            separatorBuilder: (BuildContext context, int index) => SizedBox(
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

