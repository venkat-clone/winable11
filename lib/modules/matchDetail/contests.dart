// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/widget/matchDetailCardView.dart';
import 'package:flutter/material.dart';

import '../../controllers/ContestController.dart';
import '../../models/MatchModel.dart';
import '../../models/Team.dart';
import 'matchDetailPage.dart';

class ContestsPage extends StatefulWidget {

  final MatchModel match;
  final ContestController con;
  Pair<double,double>? entryFilter;
  Pair<double,double>? prizePollFilter;
  ContestsPage({
    required this.match,
    required this.con,
    this.entryFilter,
    this.prizePollFilter,
  });

  @override
  _ContestsPageState createState() => _ContestsPageState(con: con);
}

class _ContestsPageState extends StateMVC<ContestsPage> {

  late ContestController _con ;

  _ContestsPageState({required ContestController con}):super(con){
    _con = controller as ContestController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }
  @override
  Future<bool> initAsync() async {
    await _con.initSport();
    _con.getContests(widget.match.matchId,context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print(_con.contests.value);
    if(_con.contests.loading) return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    if(_con.contests.value!.isEmpty){
      return Expanded(
        child: Center(
          child: Text("No Contest for this Match",style: TextStyle(
            color: Colors.grey
          ),),
        ),
      );
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
              itemCount: _con.contests.value!.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                final contest = _con.contests.value![index];

                if(widget.entryFilter!=null){
                  final notAboveFirst = widget.entryFilter!.first>double.parse(contest.entry);
                  final notBelowSecond = widget.entryFilter!.second<double.parse(contest.entry);
                  if(notAboveFirst || notBelowSecond){
                    return SizedBox();
                  }
                }
                if(widget.prizePollFilter!=null){
                  final notAboveFirst = widget.prizePollFilter!.first>double.parse(contest.prizePool);
                  final notBelowSecond = widget.prizePollFilter!.second<double.parse(contest.prizePool);
                  print("${widget.prizePollFilter!.first}<${double.parse(contest.prizePool)}<${widget.prizePollFilter!.second}");
                  if(notAboveFirst || notBelowSecond){
                    return SizedBox();
                  }
                }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(contest.contestName),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    AppLocalizations.of(contest.contestTag),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.6,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MatchDetailCardView(
                    contest: contest,
                    match: widget.match,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
