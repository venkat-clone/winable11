import 'package:flutter/material.dart';
import 'package:newsports/controllers/ContestController.dart';
import 'package:newsports/controllers/FeedController.dart';
import 'package:newsports/controllers/TeamController.dart';
import 'package:newsports/modules/matchDetail/myContests.dart';
import 'package:newsports/modules/matchDetail/myMatchDetail/scoreBoard.dart';
import 'package:newsports/modules/matchDetail/myMatchDetail/stats.dart';
import 'package:newsports/modules/matchDetail/myTeam.dart';

import '../../../models/MatchModel.dart';
import '../../../utils/utils.dart';
import 'commentary.dart';



class MyMatchDetailPage extends StatefulWidget {
  final MatchModel match;
  final bool showMyData;

  MyMatchDetailPage({
    required this.match,
    this.showMyData = true,
  });
  @override
  State<MyMatchDetailPage> createState() => _MyMatchDetailPageState();
}

class _MyMatchDetailPageState extends State<MyMatchDetailPage> with SingleTickerProviderStateMixin {


  late TabController _tabController;

  late  ContestController contestController ;
  late FeedController feedController;
  late TeamController teamController ;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.showMyData?5:3, vsync: this);
    contestController = ContestController();
    feedController = FeedController();
    teamController = TeamController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.match.team1.teamShortName} vs ${widget.match.team2.teamShortName}",
          style: Theme.of(context).textTheme.caption!.copyWith(
            color: Theme.of(context).textTheme.headline6!.color,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ) ,
        foregroundColor: Theme.of(context).textTheme.headline6!.color,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).dividerColor,
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              child: Image.network(
                                widget.match.team1.teamImage,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Text(
                              widget.match.team1.teamName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.match.team1Score,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                                ),
                                if(widget.match.team1Over.isNotEmpty) Text(
                                  " (${widget.match.team1Over})",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Center(child: Text(Utils.getDaySpecificDate(DateTime.parse(widget.match.matchDateTime)),style: TextStyle(
                            fontSize: 8.5,
                            fontWeight: FontWeight.bold
                          ),))),
                      Expanded(
                        flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              child: Image.network(
                                widget.match.team2.teamImage,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Text(
                              widget.match.team2.teamName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.match.team2Score,
                                  textAlign: TextAlign.center,

                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                                ),
                                if(widget.match.team2Over.isNotEmpty)Text(
                                  " (${widget.match.team2Over})",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      if(widget.showMyData)Tab(text: "My Contest"),
                      if(widget.showMyData)Tab(text: "My Teams"),
                      Tab(text: "Commentary"),
                      Tab(text: "Scoreboard"),
                      Tab(text: "Stats"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          if(widget.showMyData)MyContestsPage(match: widget.match,
          con: contestController,
          ),

          if(widget.showMyData)MyTeamPage(match: widget.match,con: teamController,),

          Commentary(feedController: feedController, match: widget.match,),

          ScoreBoard(
            feedController: feedController,
            matchId: widget.match.matchId,
          ),

          Stats(
            feedController: feedController,
            matchId: widget.match.matchId,
          ),
        ],
      ),
    );
  }


}
