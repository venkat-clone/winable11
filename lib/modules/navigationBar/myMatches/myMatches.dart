// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/MatchController.dart';
import 'package:newsports/models/soprt.dart';
import 'package:newsports/modules/navigationBar/myMatches/completed.dart';
import 'package:newsports/modules/navigationBar/myMatches/live.dart';
import 'package:newsports/modules/navigationBar/myMatches/upcoming.dart';
import 'package:flutter/material.dart';

class MyMatchesPage extends StatefulWidget {
  @override
  _MyMatchesPageState createState() => _MyMatchesPageState();
}

class _MyMatchesPageState extends StateMVC<MyMatchesPage> {
  bool isUpcoming = true;
  bool isLive = false;
  bool isCompleted = false;
  late MatchController _con ;

  _MyMatchesPageState() :super(MatchController()){
    _con = controller as MatchController;
  }

  @override
  void initState() {
    _con.initSport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('My Matches'),
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
      body: Column(
        children: [
          Container(
            color: Theme.of(context).appBarTheme.color,
            height: AppBar().preferredSize.height,
            child: tabBar(),
          ),
          Divider(height: 1,),
          isUpcoming
              ? UpComingPage(con: _con,)
              : isLive
                  ? LivePage(controller: _con,)
                  : isCompleted
                      ? CompletedPage(controller: _con,)
                      : SizedBox(),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isUpcoming = true;
                isLive = false;
                isCompleted = false;
              });
            },
            child: Text(
              AppLocalizations.of('Upcoming'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isUpcoming == true ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              setState(() {
                isUpcoming = false;
                isLive = true;
                isCompleted = false;
              });
            },
            child: Text(
              AppLocalizations.of('Live'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isLive == true ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              setState(() {
                isUpcoming = false;
                isLive = false;
                isCompleted = true;
              });
            },
            child: Text(
              AppLocalizations.of('Completed'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isCompleted == true ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
