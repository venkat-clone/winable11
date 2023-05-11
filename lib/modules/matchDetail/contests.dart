// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/widget/matchDetailCardView.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/ContestController.dart';
import '../../models/MatchModel.dart';
import '../../models/Team.dart';
import 'contestDetail/select_team.dart';
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
  RefreshController _refreshController = RefreshController(initialRefresh: false);

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
    if(_con.contests.value==null){
      _con.getContests(widget.match.matchId,context);
    }

    return true;
  }

  void _onRefresh() async{
    await _con.getMyContests(widget.match.matchId,context);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {

    if(_con.contests.loading) return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    if(_con.contests.error!=null){
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        child: Center(
          child: Text(_con.contests.error!,style: TextStyle(
              color: Colors.grey
          ),),
        ),
      );
    }
    if(_con.contests.value!.isEmpty || _con.contests.value==null){
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        child: Center(
          child: Text("No Contest for this Match",style: TextStyle(
            color: Colors.grey
          ),),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
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
                    joinContest: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>SelectTeam(
                        matchId: widget.match.matchId,
                        match: widget.match,
                        saveTeam: (team)async{
                          // print(contest.matchId);
                          contest.matchId = widget.match.matchId;
                          _con.joinContest(context,contest,team.teamId);

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          _con.successSnackBar("Successfully joined the contest", context);
                        },
                      )));
                    },
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
