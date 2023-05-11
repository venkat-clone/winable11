// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsports/models/player.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../controllers/ContestController.dart';
import '../../controllers/TeamController.dart';
import '../../models/MatchModel.dart';
import '../../models/my_team.dart';
import '../../models/team_players.dart';
import '../../utils/designations.dart';
import '../createTeam/createTeam.dart';
import '../createTeam/teamPreview.dart';

class MyTeamPage extends StatefulWidget {
  final MatchModel match;
  TeamController con ;

  MyTeamPage({
    required this.match,
    required this.con,
  });
  @override
  _MyTeamPageState createState() => _MyTeamPageState(con);
}

class _MyTeamPageState extends StateMVC<MyTeamPage> {


  late TeamController _con ;

  _MyTeamPageState(TeamController con):super(con){
    _con = controller as TeamController;
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);


  @override
  void initState() {
    initAsync();
    super.initState();
  }

  _refresh() async{
    await _con.getMyTeam(widget.match);
    _refreshController.refreshCompleted();
  }

  @override
  Future<bool> initAsync()  async{
    await _con.getSport();
    if(_con.myTeams.value==null){
      _con.getMyTeam(widget.match);
    }
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {

    if(_con.myTeams.loading) return Center(
      child: CircularProgressIndicator(),
    );
    if(_con.myTeams.value!.isEmpty){
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _refresh,
        enablePullUp: true,
        child: Center(
          child: Text("there are no teams for this match please create team",style: TextStyle(
              color: Colors.grey
          ),textAlign: TextAlign.center,),
        ),
      );
    }

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _refresh,
      enablePullUp: true,
      child: ListView(
        children: [
          ..._con.myTeams.value!.map((e) {
            return MyTeamCard(team: e,sport: _con.sport??"",match: widget.match,);
          }),
        ],
      ),
    );
  }


}


class MyTeamCard extends StatefulWidget {
  TeamPlayers team;
  String sport;
  final MatchModel match;
  MyTeamCard({Key? key,required this.team,required this.sport,required this.match}) : super(key: key);

  @override
  State<MyTeamCard> createState() => _MyTeamCardState();
}

class _MyTeamCardState extends State<MyTeamCard> {



  TeamPlayers get team=>widget.team;
  Widget playerDetail(String txt1, String txt2, String playerImage,String teamImage,) {
    String url = "";
    if(playerImage.isNotEmpty){
      url = playerImage;
    } else{
      url = teamImage;
    }
    return Stack(
      //alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(height: 55, width: 55, child: Image.network(url,errorBuilder: (c,o,s){
            return Image.asset(
              ConstanceData.appLogo,
              fit: BoxFit.cover,
            );
          },)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 6, right: 6, top: 2, bottom: 2),
                  child: IntrinsicHeight(
                    child: Text(
                      txt1,
                      // softWrap: true,
                      // maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border:
            Border.all(color: (Theme.of(context).textTheme.headline6!.color!)),
          ),
          child: Center(
            child: Text(
              txt2,
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black,
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (c)=>TeamPreViewPage(players: team.players,)));
        },
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),

            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .color!
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(team.teamName),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.6,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>CreateTeamPage(
                                          match:widget.match,
                                          teamPlayers:team
                                      )));
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () async{
                                      await Clipboard.setData(ClipboardData(text: team.teamId));
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    /// TODO scores for teams
                                    // Text(
                                    //   team.teamA,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(
                                    //     color: Colors.white,
                                    //     letterSpacing: 0.6,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 10,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   team.teamBScore,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(
                                    //     color: Colors.white,
                                    //     letterSpacing: 0.6,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    /// TODO scores for teams
                                    // Text(
                                    //   team.teamA,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(
                                    //     color: Colors.white,
                                    //     letterSpacing: 0.6,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 10,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   team.teamAScore,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(
                                    //     color: Colors.white,
                                    //     letterSpacing: 0.6,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                // Expanded(child: SizedBox()),
                                Expanded(
                                  child: playerDetail(
                                    team.captainName??"",
                                    "C",
                                    team.captain.image,""
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: playerDetail(
                                    team.viceCaptainName??"",
                                    "VC", team.viceCaptain.image,""
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .appBarTheme
                            .color!
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          children: [
                            Text(
                              Designation.getDesignation(widget.sport, 4).shortName,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Colors.black45,
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              team.players.where((element) => element.designationId=="4").length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                                Designation.getDesignation(widget.sport, 1).shortName,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Colors.black45,
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                team.players.where((element) => element.designationId=="1").length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                                Designation.getDesignation(widget.sport, 3).shortName,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Colors.black45,
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              team.players.where((element) => element.designationId=="3").length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              Designation.getDesignation(widget.sport, 2).shortName,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Colors.black45,
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              team.players.where((element) => element.designationId=="4").length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

