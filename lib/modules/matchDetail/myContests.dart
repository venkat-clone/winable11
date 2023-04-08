// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

import '../../controllers/ContestController.dart';
import '../../models/MatchModel.dart';
import '../../widget/matchDetailCardView.dart';

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
    await _con.getMyContests(widget.match.matchId,context);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {
    if(_con.myContests.loading) return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    if(_con.myContests.error!=null){
      return Expanded(
        child: Center(
          child: Text(_con.myContests.error!),
        ),
      );
    }
    if(_con.myContests.value!.isEmpty){
      return Center(
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
            Text(
              AppLocalizations.of('What are you waiting for?'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.black54,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xff317E2F),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of('Join A Contest'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
                    joinContest: (){

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
