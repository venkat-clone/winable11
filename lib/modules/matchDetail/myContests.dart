// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/ContestController.dart';
import '../../models/MatchModel.dart';
import '../../widget/matchDetailCardView2.dart';

class MyContestsPage extends StatefulWidget {
  final MatchModel match;
  final ContestController con;
  MyContestsPage({
    required this.match,
    required this.con,
  });
  @override
  _MyContestsPageState createState() => _MyContestsPageState(con: con);
}

class _MyContestsPageState extends StateMVC<MyContestsPage> {

  late ContestController _con ;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  _MyContestsPageState({required ContestController con}):super(con){
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
    if(_con.myContests.value==null){
      await _con.getMyContests(widget.match.matchId,context);
    }
    return super.initAsync();
  }

  void _onRefresh() async{
    await _con.getMyContests(widget.match.matchId,context);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }


  @override
  Widget build(BuildContext context) {
    if(_con.myContests.loading) return Center(
      child: CircularProgressIndicator(),
    );
    if(_con.myContests.error!=null){
      return Center(
        child: Text(_con.myContests.error!),
      );
    }
    if(_con.myContests.value!.isEmpty ){
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                AppLocalizations.of("You haven't joined a contest yet!"),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black54,
                      letterSpacing: 0.6,
                      fontSize: 16,
                    ),
              ),
              SizedBox(
                height: 50,
              ),
             
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: _con.myContests.value!.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              final contest = _con.myContests.value![index];
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
                    //joinContest: (){},
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
