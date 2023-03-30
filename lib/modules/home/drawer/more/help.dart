// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsports/modules/home/drawer/more/howToPlay/football.dart';

import 'howToPlay/cricket.dart';
import 'howToPlay/what_is_winable11.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('How To Play'),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
                letterSpacing: 0.6,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              card(
                AppLocalizations.of('What is Fantasy'),
                FontAwesomeIcons.trophy,
                AssetImage(
                  ConstanceData.palyerProfilePic,
                ), (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WhatIsWinable11()));
                  }
              ),
              SizedBox(
                width: 15,
              ),
              card(
                AppLocalizations.of('Cricket'),
                FontAwesomeIcons.bowlingBall,
                AssetImage(
                  ConstanceData.cricketPlayer,
                ),
                  (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cricket()));

                  }
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              card(
                AppLocalizations.of('Football'),
                FontAwesomeIcons.footballBall,
                AssetImage(
                  ConstanceData.footballPlayer,
                ),
                  (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FootBall()));
                  }
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(child: SizedBox())
              // card(
              //   AppLocalizations.of('Kabaddi'),
              //   Icons.sports_handball,
              //   AssetImage(
              //     ConstanceData.kabadiplayer,
              //   ),
              // )
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     card(
          //       AppLocalizations.of('Baseball'),
          //       FontAwesomeIcons.baseballBall,
          //       AssetImage(
          //         ConstanceData.baseballPlayer,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     card(
          //       AppLocalizations.of('Basketball'),
          //       FontAwesomeIcons.basketballBall,
          //       AssetImage(
          //         ConstanceData.basketballPlayer,
          //       ),
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     card(
          //       AppLocalizations.of('Hockey'),
          //       FontAwesomeIcons.hockeyPuck,
          //       AssetImage(
          //         ConstanceData.hockyPlayer,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     card(
          //       AppLocalizations.of('Volleyball'),
          //       FontAwesomeIcons.volleyballBall,
          //       AssetImage(
          //         ConstanceData.volleyballPlyer,
          //       ),
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     card(
          //       AppLocalizations.of('Handball'),
          //       Icons.sports_handball,
          //       AssetImage(
          //         ConstanceData.handballPlayer,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     card(
          //       AppLocalizations.of('NFL'),
          //       FontAwesomeIcons.footballBall,
          //       AssetImage(
          //         ConstanceData.nflPlayer,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  Widget card(String txt1, IconData icon, AssetImage image,Function() onPressed) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  txt1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.6,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
