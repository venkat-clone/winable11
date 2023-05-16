// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/Team.dart';
import 'package:newsports/modules/createTeam/chooseCaptain.dart';
import 'package:newsports/modules/createTeam/teamPreview.dart';
import 'package:newsports/widget/teamCardView.dart';
import 'package:flutter/material.dart';
import 'package:newsports/constance/global.dart' as globals;
import '../../constance/constance.dart';
import '../../controllers/TeamController.dart';
import '../../models/Contest.dart';
import '../../models/MatchModel.dart';
import '../../models/player.dart';
import '../../models/team_players.dart';
import '../../models/userTeamPlayer.dart';
import '../../utils/designations.dart';
import '../../utils/utils.dart';
import '../../widget/timeLeft.dart';

class CreateTeamPage extends StatefulWidget {
  MatchModel match;
  TeamPlayers? teamPlayers;
  CreateTeamPage({ required this.match,this.teamPlayers});

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends StateMVC<CreateTeamPage> {

  late TeamController _con;
  _CreateTeamPageState():super(TeamController()){
    _con = controller as TeamController;
  }

  @override
  void initState() {
    // _con.getAllPlayers(context);
    initAsync();
    super.initState();
  }


  @override
  Future<bool> initAsync() async{
    await _con.getSport();
    initilize();
    return super.initAsync();
  }

  initilize() async{
    await _con.getMatchPlayers(context,widget.match);
    if(widget.teamPlayers!=null){
      addPLayersExistingPLayers(widget.teamPlayers!);
    }
    _con.cricketTeam.matchId = widget.match.matchId;
  }

  addPLayersExistingPLayers(TeamPlayers teamPlayers) async {
    while(_con.userTeamPlayer.isEmpty) await Future.delayed(Duration(seconds: 1));
    _con.cricketTeam.newTeam = false;
    _con.oldTeam = teamPlayers;
    print("oldTeamId:${_con.oldTeam!.teamId}");
    teamPlayers.players.forEach((element) {
      final p = _con.userTeamPlayer.indexWhere((e) => e.pid==element.pid);

      if(p!=-1){
        _con.appPlayer(
            _con.userTeamPlayer[p],
            context,
            widget.match.team1.teamShortName ==
                _con.userTeamPlayer[p].teamShortName);
      }
    });
  }

  bool isWk = true;
  bool isBAT = false;
  bool isAR = false;
  bool isBowl = false;

  bool creditsSort = true;

  @override
  Widget build(BuildContext context) {

    final teamCreated = _con.cricketTeam.players.length==11;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).dividerColor,
              ),
              appBar(),
              Container(
                height: 40,
                child: tabBar(),
              ),
              // Container(
              //   height: 40,
              //   color: Theme.of(context).disabledColor.withOpacity(0.3),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20, right: 20),
              //     child: Row(
              //       children: [
              //         Text(
              //           AppLocalizations.of('Select 1-4 Wicket-Keepers'),
              //           style: Theme.of(context).textTheme.bodyText2!.copyWith(
              //                 color: Theme.of(context).textTheme.headline6!.color,
              //                 fontWeight: FontWeight.bold,
              //                 letterSpacing: 0.6,
              //                 fontSize: 12,
              //               ),
              //         ),
              //         Expanded(child: SizedBox()),
              //         Icon(
              //           Icons.sort,
              //           color: Theme.of(context).textTheme.headline6!.color,
              //           size: 20,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of('SELECT BY'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: (){
                          setState(() {
                            creditsSort = false;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of('POINTS'),
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: creditsSort?Colors.black54:Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6,
                                    fontSize: 10,
                                  ),
                            ),
                            if(!creditsSort)
                              Icon(Icons.arrow_drop_down,color: Theme.of(context).primaryColor,)
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: (){
                          setState(() {
                            creditsSort = true;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of('CREDITS'),
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: creditsSort?Theme.of(context).primaryColor:Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6,
                                    fontSize: 10,
                                  ),
                            ),
                            if(creditsSort)Icon(Icons.arrow_drop_down,color: Theme.of(context).primaryColor,)
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),

              playerList(
                  isWk ? _con.players4
                  : isBAT ?_con.players1
                  : isAR ?_con.players3
                  : isBowl ? _con.players2
                  :[],
                isWk ? _con.cricketTeam.players4
                    : isBAT ?_con.cricketTeam.players1
                    : isAR ?_con.cricketTeam.players3
                    : isBowl ? _con.cricketTeam.players2
                    :[],
              ),
              // isWk == true
              //     ? wk()
              //     : isBAT == true
              //     ? bat()
              //     : isAR == true
              //     ? ar()
              //     : isBowl == true
              //     ? bowl()
              //     : SizedBox(),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamPreViewPage(team:_con.cricketTeam,team1: widget.match.team1,team2: widget.match.team2,),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Team Preview'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Color(0xff317E2F),
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(_con.cricketTeam.players.length<11){
                    _con.errorSnackBar("Team must Contain 11 players", context);
                    return;
                  }
                  final test =[
                    _con.cricketTeam.players1,
                    _con.cricketTeam.players2,
                    _con.cricketTeam.players3,
                    _con.cricketTeam.players4,
                  ];
                  int i =1;
                  bool flag =false;
                  test.forEach((element) {
                    if(element.length==0 && flag==false){
                      _con.errorSnackBar("atleast 1 ${Designation.getDesignation(_con.sport, i).fullName} should be there in team", context);
                      flag = true;
                    }
                    i=i+1;
                  });
                  if(flag) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseCaptainPage(team: _con.cricketTeam,matchDateTime:widget.match.matchDateTime,teamPlayers: widget.teamPlayers,),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: teamCreated?Colors.transparent:Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Continue'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: teamCreated?Color(0xff317E2F):Theme.of(context).textTheme.caption!.color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget playerList(List<UserTeamPlayer> playersList,List<UserTeamPlayer> selectedPlayersList){

    if(playersList.isEmpty){
      return Expanded(child: Center(
        child: Text(" no player found"),
      ));
    }
    if(_con.loading){
      return Expanded(child: Center(
        child: CircularProgressIndicator(),
      ));
    }

    playersList.sort((a,b){
      if(creditsSort)
      return double.parse(b.creditPoints).compareTo(double.parse(a.creditPoints));
      else
        return double.parse(b.points).compareTo(double.parse(a.points));

    });

    final announced = playersList.where((element) => element.announced && !element.substitute );
    final substitute = playersList.where((element) => element.announced && element.substitute);
    final unannounced = playersList.where((element) => !element.announced );

    return Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            if(selectedPlayersList.isNotEmpty)Container(
              color: Colors.black,
              padding: EdgeInsets.all(6),
              child: Text("Selected Players",
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
              ),),
            ),
            ...selectedPlayersList.map<Widget>((player){
              ImageProvider? image ;
              if(player.image.isNotEmpty){
                image = NetworkImage(player.image);
              }
              return InkWell(
                onTap: (){
                  _con.removePlayer(player,context,widget.match.teamid1==player.teamId);
                },
                child: PlayerCardView(
                  txt1: player.teamShortName,
                  txt2: player.name,
                  txt3: AppLocalizations.of(''),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: player.points,
                  txt6: player.creditPoints,
                  image1: image ?? AssetImage(ConstanceData.villiers),
                  selected: true,
                ),
              );
            }),
            if(announced.isNotEmpty) playersSection("Announced Players"),
            ...announced.map<Widget>(playerCard),
            if(substitute.isNotEmpty) playersSection("Substitute Players"),
            ...substitute.map<Widget>(playerCard),
            if(unannounced.isNotEmpty) playersSection("${(announced.isNotEmpty && substitute.isNotEmpty)?'Unannounced':''} Players"),
            ...unannounced.map<Widget>(playerCard),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 70,
            )
          ],
        )
    );
  }
  //"${(announced.isNotEmpty && substitute.isNotEmpty)?'Unannounced':''} Players"

  Widget playersSection(String text){
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 4),
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(6),
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600
          ),),
      ),
    );
  }

  Widget playerCard(UserTeamPlayer player){
    ImageProvider? image ;

    if(player.selected){
      return SizedBox();
    }

    if(player.image.isNotEmpty){
      image = NetworkImage(player.image,);
    }
    return InkWell(
      onTap: (){
        _con.appPlayer(player,context,widget.match.team1.teamShortName ==player.teamShortName);
      },
      child: PlayerCardView(
        txt1: player.teamShortName,
        txt2: player.name,
        txt3: AppLocalizations.of(Designation.getDesignation(Designation.cricket, int.parse(player.designationId)).fullName),
        txt4: AppLocalizations.of(player.playingStatus=='1'?'Played last match':'Not played last match'),
        txt5: player.points,
        txt6: player.creditPoints,
        image1: image ?? AssetImage(ConstanceData.villiers),
      ),
    );
  }


  Widget tabBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isWk = true;
              isBAT = false;
              isAR = false;
              isBowl = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Text(
              AppLocalizations.of('${_con.getShortDesignation(4)}(${_con.cricketTeam.players4.length})'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isWk ? Theme.of(context).primaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            setState(() {
              isWk = false;
              isBAT = true;
              isAR = false;
              isBowl = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              AppLocalizations.of('${_con.getShortDesignation(1)}(${_con.cricketTeam.players1.length})'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isBAT ? Theme.of(context).primaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            setState(() {
              isWk = false;
              isBAT = false;
              isAR = true;
              isBowl = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: Text(
              AppLocalizations.of('${_con.getShortDesignation(3)}(${_con.cricketTeam.players3.length})'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isAR ? Theme.of(context).primaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            setState(() {
              isWk = false;
              isBAT = false;
              isAR = false;
              isBowl = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: Text(
              AppLocalizations.of('${_con.getShortDesignation(2)}(${_con.cricketTeam.players2.length})'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isBowl ? Theme.of(context).primaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).dividerColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).textTheme.headline6!.color,
                            size: 24,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        TimeLeftText(
                          widget.match.matchDateTime,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.help,
                          color: Theme.of(context).textTheme.headline6!.color,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    AppLocalizations.of(widget.match.matchStatusNote.isNotEmpty?widget.match.matchStatusNote:'Max 7 palyers from a team'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of('Players'),
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
                              children: [
                                Text(
                                  _con.cricketTeam.players.length.toString(),
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.headline6!.color,
                                        letterSpacing: 0.6,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  "/11",
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
                        Container(
                          margin: EdgeInsets.all(2),
                          height: 30,
                          width: 30,
                          child: Image.network(
                            widget.match.team2.teamImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.match.team1.teamShortName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _con.cricketTeam.teamACount.toString(),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.match.team2.teamShortName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _con.cricketTeam.teamBCount.toString(),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(2),
                          height: 30,
                          width: 30,
                          child: Image.network(
                            widget.match.team1.teamImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of('Credits Left'),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _con.creditsLeft.toString(),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      children: List<Widget>.generate(11*2+1, (index) {

                        if(22==index){
                          return Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){
                                  _con.clearCricketMatch();
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                                  size: 22,
                                ),
                              ),
                            ),
                          );
                        }

                        if(index.isEven)
                          return SizedBox(width: 3,);

                        return customContainer(
                                _con.cricketTeam.players.length>(index/2) ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!,
                          );

                      }).toList(),
                      // children: [
                      //   customContainer(
                      //     globals.tap1 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!,
                      //   ),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap2 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap3 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(
                      //     globals.tap4 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!,
                      //   ),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap5 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap6 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap7 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap8 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap9 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap10 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   customContainer(globals.tap11 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                      //   Expanded(child: SizedBox()),
                      //   Icon(
                      //     Icons.remove_circle_outline,
                      //     color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                      //     size: 22,
                      //   )
                      // ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customContainer(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
