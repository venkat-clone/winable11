// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:newsports/utils/utils.dart';

import '../../../controllers/winnerController.dart';
import '../../../models/MatchWinner.dart';
import 'matchWinners.dart';

class WinnerPage extends StatefulWidget {
  @override
  _WinnerPageState createState() => _WinnerPageState();
}

class _WinnerPageState extends StateMVC<WinnerPage> {

  late WinnerController _con;

  _WinnerPageState():super(WinnerController()){
    _con = controller as WinnerController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() async{
    await _con.getSport();
    getWinners();
    // _con.getWinners();
    return super.initAsync();
  }
  getWinners() async{
    await _con.getWinners();
    await _con.getCricketWinners();
    setState(() {
      _con.getCricketWinners();
    });
    // await Future.delayed(Duration(seconds: 4));
    print(_con.winnerMatches.value);
    setState(() { });
    if(_con.winnerMatches.value==null){
      getWinners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Winners'),
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
            size: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
      body: _con.winnerMatches.loading ?
      Center(child: CircularProgressIndicator(),) :
      _con.winnerMatches.error != null ? Center(
        child: Text(_con.winnerMatches.error??""),
      )  : ListView(
        children: [
            Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of('Mega Contest Winners'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('Filter by Tour'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.sort,
                      color: Colors.black87,
                      size: 18,
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                ...?_con.winnerMatches.value?.map((match) {
                  // final winners = match.winners;

                  String winningString = "";

                  if(match.winnerTeam==match.teamid1){
                    winningString = "${match.team1.teamName} won with ${match.team1Score} in ${match.team1Over} overs";
                  }else{
                    winningString = "${match.team2.teamName} won with ${match.team2Score} in ${match.team1Over} overs";
                  }

                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c)=> MatchWinnersPage(match: match,))
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        match.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      match.matchDateTime,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      child:
                                      Image.network(match.team1.teamImage),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      match.team1.teamShortName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      "vs",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      match.team2.teamShortName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      child: Image.network(match.team2.teamImage),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      match.team1Score,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      match.team2Score,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  winningString,
                                  style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                    color: Color(0xff317E2F),
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: 180,
                              //   child: ListView(
                              //     scrollDirection: Axis.horizontal,
                              //     padding: EdgeInsets.only(left: 20, right: 20),
                              //     children: [
                              //       Row(
                              //         children: winners.map<Widget>((e) {
                              //           return cardView(
                              //             'Rank #${e.rank}',
                              //             e.name,
                              //             'Won ${e.winingAmount}',
                              //             AssetImage(
                              //               ConstanceData.siraj,
                              //             )
                              //           );
                              //         }).toList(),
                              //       )
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget cardView(String txt1, String txt2, String txt3, AssetImage image) {
    return Card(
      elevation: 5,
      child: Container(
        height: 140,
        width: 120,
        color: Theme.of(context).appBarTheme.color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                txt1,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      fontSize: 10,
                    ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                txt2,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      letterSpacing: 0.6,
                      fontSize: 10,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                  radius: 34,
                  backgroundColor: Theme.of(context).textTheme.headline6!.color,
                  backgroundImage: image),
            ),
            Expanded(child: SizedBox()),
            Container(
              color: Theme.of(context).primaryColor,
              height: 20,
              child: Center(
                child: Text(
                  txt3,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
