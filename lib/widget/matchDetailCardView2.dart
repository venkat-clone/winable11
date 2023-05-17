
// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/ContestController.dart';
import 'package:newsports/controllers/WalletController.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/modules/matchDetail/contestDetail/contestDetail.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../modules/home/drawer/more/Tarms.dart';
import '../modules/matchDetail/contestDetail/contestDetail.dart';
import '../modules/matchDetail/contestDetail/select_team.dart';
import '../utils/utils.dart';
import '../utils/value_notifiers.dart';

class MatchDetailCardView extends StatelessWidget {
  final MatchModel match;
  final Contest contest;

  MatchDetailCardView({
    Key? key,
    required this.contest,
    required this.match,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContestDetailPage(contest: contest,match: match, joinContest: null,),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
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
                    Expanded(child: SizedBox()),
                    
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
                      '${int.parse(contest.totalTeam)-int.parse(contest.filledSpots)} spots left',
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
              SizedBox(
                height: 15,
              ),
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
                      // Text(
                      //   AppLocalizations.of('₹1 Lakh'),
                      //   style: Theme.of(context).textTheme.caption!.copyWith(
                      //         color: Theme.of(context).textTheme.caption!.color,
                      //         letterSpacing: 0.6,
                      //         fontSize: 10,
                      //       ),
                      // ),
                      // Expanded(child: SizedBox()),
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
            ],
          ),
        ),
      ),
    );
  }
}








