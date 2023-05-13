// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/modules/matchDetail/contestDetail/addCash.dart';
import 'package:newsports/modules/matchDetail/contestDetail/detail.dart';
import 'package:newsports/modules/matchDetail/contestDetail/leaderboard.dart';
import 'package:newsports/modules/matchDetail/contestDetail/select_team.dart';
import 'package:newsports/utils/utils.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/matchDetailCardView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controllers/ContestController.dart';
import '../../../models/Contest.dart';
import '../../../models/MatchModel.dart';
import '../../../models/Team.dart';
import '../../../models/Winnings.dart';
import '../../../widget/timeLeft.dart';

class ContestDetailPage extends StatefulWidget {
  final Contest contest;
  final MatchModel match;
  void Function() joinContest;
  ContestDetailPage({
    required this.contest,
    required this.match,
    required this.joinContest,
  });

  @override
  _ContestDetailPageState createState() => _ContestDetailPageState();
}

class _ContestDetailPageState extends StateMVC<ContestDetailPage> {

  bool isleaderboard = false;
  bool isContest = true;
  Contest get contest=>widget.contest;
  late ContestController _con;
  _ContestDetailPageState():super(ContestController()) {
    _con = controller as ContestController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() async{
    _con.getMatchWinnings(context,widget.contest.contestId);
    _con.getContestRankings(context,widget.contest);
    return super.initAsync();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Container(
            height: AppBar().preferredSize.height,
            color: Colors.black87,
            child: appBar(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of('Prize Pool'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 10,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      '₹${Utils.convertToIndianCurrency(double.parse(contest.prizePool))}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox()),

                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              LinearPercentIndicator(
                percent: min(1, (double.parse(contest.filledSpots)/double.parse(contest.totalTeam))),
                progressColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of('${int.parse(contest.totalTeam)-int.parse(contest.filledSpots)} sports left'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Color(0xffD30001),
                        letterSpacing: 0.6,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('${contest.totalTeam} spots'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black54,
                        letterSpacing: 0.6,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: InkWell(
                  onTap: (){
                    if(widget.match.isStarted){
                      return;
                    }
                    showDialog(context: context, builder: (context)=>
                        JoinContestCard(fee: double.parse(contest.entry),contestId: contest.contestId,accept: widget.joinContest,),
                      barrierDismissible: false,

                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    // width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        color: !widget.match.isStarted? Theme.of(context).primaryColor:
                        Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        "₹${contest.entry}",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8,),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
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
                      Text(
                        Utils.convertToIndianCurrency(double.parse(widget.contest.prizePool)),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.caption!.color,
                          letterSpacing: 0.6,
                          fontSize: 10,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text((double.parse(contest.filledSpots)/double.parse(contest.totalTeam)*100).toStringAsFixed(2),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.caption!.color,
                          letterSpacing: 0.6,
                          fontSize: 10,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('Upto ${contest.winners} Entries'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.caption!.color,
                          letterSpacing: 0.6,
                          fontSize: 10,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).textTheme.caption!.color,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(contest.contestDescription,style: Theme.of(context).textTheme.caption,),
              ),
              SizedBox(height: 8,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Text("Note",style: TextStyle(
                      fontSize: 14
                  ),)),
              SizedBox(height: 4,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(contest.contestNote1,style: Theme.of(context).textTheme.caption,),
              ),
              SizedBox(height: 4,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(contest.contestNote2,style: Theme.of(context).textTheme.caption,),
              ),
            ],
          ),
          Divider(
            height: 1,
          ),
          Container(
            height: 40,
            color: Theme.of(context).appBarTheme.color,
            child: tabBar(),
          ),
          isContest == true
              ? DetailPage(
            winningNote: contest.winningNote,
            winnings: _con.winnings,
          )
              : isleaderboard == true
                  ? LeaderboardPage(contestTeam: _con.userRankings,)
                  : SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).textTheme.headline6!.color,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            context: context,
            builder: (context) => Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of('You have not created a group yet'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontSize: 18,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        ConstanceData.group,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of('Add friends and discuss everything sport.'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: AppLocalizations.of('Create Group'),
                  ),
                  CustomButtonBorder(
                    text: AppLocalizations.of('Cancel'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget tabBar() {
    return Row(
      children: [
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isContest = true;
              isleaderboard = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 50),
            child: Text(
              AppLocalizations.of('Winnings'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isContest == true ? Theme.of(context).textTheme.headline6!.color : Colors.black38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isContest = false;
              isleaderboard = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 50),
            child: Text(
              AppLocalizations.of('Teams'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isleaderboard == true ? Theme.of(context).textTheme.headline6!.color : Colors.black38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of('${widget.match.team1.teamShortName} vs ${widget.match.team2.teamShortName}'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        fontSize: 22,
                      ),
                ),
                TimeLeftText(
                  widget.match.matchDateTime,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.6,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of('Total Balance'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "₹0",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).textTheme.headline6!.color,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCashPage(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xff317E2F),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of('Add cash'),
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            color: Colors.white,
                                            letterSpacing: 0.6,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              indent: 14,
                              endIndent: 14,
                            ),
                            row(AppLocalizations.of('Amount Added'), "₹0"),
                            row(AppLocalizations.of('Winnings'), "₹0"),
                            row(AppLocalizations.of('Cash Bonus'), "₹0"),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black12,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              FontAwesomeIcons.wallet,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget row(String txt1, String txt2) {
    return Column(
      children: [
        Container(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      txt1,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      txt2,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.error_outline,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 14,
          endIndent: 14,
        ),
      ],
    );
  }
}
