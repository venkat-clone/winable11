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

  late MatchController _con;
  final scrollController = ScrollController();
  _CricketPageState() : super(MatchController()) {
    _con = controller as MatchController;
  }

  @override
  void initState() {
    super.initState();
    // _con.getMatches(context);
  
    _con.getUpcommingMatches(context);
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of('My Matches'),
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: CardView(
                      txt1: AppLocalizations.of('Cricket IPL'),
                      txt2: AppLocalizations.of('Mumbai Indians'),
                      txt3: AppLocalizations.of('Kolkata'),
                      txt4: "MI",
                      setTime: CountdownTimer(
                        endTime: DateTime.now().millisecondsSinceEpoch +
                            1000 * 60 * 60,
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
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 15),
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
                    if (false)
                      Scrollbar(
                        controller: scrollController,
                        isAlwaysShown: true,
                        child: ListView.separated(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return CardShimmer();
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 15,
                          ),
                        ),
                      ),
                    _con.upCommingMatcheList.length > 0
                        ? Scrollbar(
                            controller: scrollController,
                            isAlwaysShown: true,
                            child: ListView.separated(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: _con.upCommingMatcheList.length,
                              itemBuilder: (c, index) {
                                final match = _con.upCommingMatcheList[index];
                                final teamA = _con.teams[match.teamid1];
                                final teamB = _con.teams[match.teamid2];

                                return CardView(
                                  txt1: AppLocalizations.of(match.title),
                                  txt2: AppLocalizations.of(
                                      teamA?.teamName ?? ""),
                                  txt3: AppLocalizations.of(
                                      teamB?.teamName ?? ""),
                                  txt4: teamA?.teamShortName ?? "",
                                  // setTime: CountdownTimer(
                                  //   endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
                                  //   textStyle: TextStyle(
                                  //     fontSize: 14,
                                  //     color: Colors.red,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  setTime: Text(
                                    match.matchDateTime,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  txt6: teamB?.teamShortName ?? "",
                                  txt7: AppLocalizations.of('1 Team'),
                                  image1: Image.network(
                                    teamA?.teamImage ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                  image2: Image.network(
                                    teamB?.teamImage ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: 15,
                              ),
                            ))
                        : Center(
                            child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "No  Matches",
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
    );
  }
}

class CardShimmer extends StatelessWidget {
  const CardShimmer({Key? key}) : super(key: key);
  static const _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: Card(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey,
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Mega",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.outbox,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
