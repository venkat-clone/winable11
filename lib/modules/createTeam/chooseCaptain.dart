// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:newsports/controllers/TeamController.dart';

import '../../models/team_players.dart';
import '../../models/player.dart';

import '../../models/userTeamPlayer.dart';
import '../../utils/utils.dart';
import '../../widget/timeLeft.dart';

class ChooseCaptainPage extends StatefulWidget {
  
  TeamPlayers team;
  String matchDateTime ="";
  TeamPlayers? teamPlayers;
  ChooseCaptainPage({required this.team,required this.matchDateTime,this.teamPlayers});

  @override
  _ChooseCaptainPageState createState() => _ChooseCaptainPageState();
}

class _ChooseCaptainPageState extends StateMVC<ChooseCaptainPage> {
  String captainId = "";
  String wiseCaptainId = "";

  late TeamController _con;

  _ChooseCaptainPageState (): super(TeamController()){
    
    _con = controller as TeamController;
    
  }

  @override
  void initState() {
    _con.cricketTeam = widget.team;
    if(widget.teamPlayers!=null) {
      _con.oldTeam = widget.teamPlayers;
    }
  }


  @override
  Widget build(BuildContext context) {

    final saveTeam = captainId.isNotEmpty && wiseCaptainId.isNotEmpty;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: AppBar().preferredSize.height,
                color: Theme.of(context).primaryColor,
                child: appBar(),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).disabledColor.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of('Choose your Captain and Vice Captain'),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of('C gets 2x points, VC gets 1.5x points'),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of('Type'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        AppLocalizations.of('Points'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('Captain'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        AppLocalizations.of('Vice Captain'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        ...widget.team.players.map((UserTeamPlayer player) {
                          ImageProvider? image;
                          if(player.image.isEmpty){
                            image = NetworkImage(player.image);
                          }
                          return cardView(player);
                        }),

                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 70,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InkWell(
              //   onTap: () {
              //
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     child: Card(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //       child: Container(
              //         height: 40,
              //         width: 140,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(6),
              //         ),
              //         child: Center(
              //           child: Text(
              //             AppLocalizations.of('Team Preview'),
              //             style: Theme.of(context).textTheme.caption!.copyWith(
              //                   color: Color(0xff317E2F),
              //                   letterSpacing: 0.6,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 16,
              //                 ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  if(captainId.isEmpty){
                    /// TO SHOW SNAKEBAR
                    _con.errorSnackBar('Please select the Captain', context);
                    return;
                  }
                  if(wiseCaptainId.isEmpty){
                    /// TO SHOW SNAKEBAR
                    _con.errorSnackBar('Please select the Vise Captain', context);
                    return;
                  }

                  _con.cricketTeam.captainId = captainId;
                  _con.cricketTeam.viceCaptainId = wiseCaptainId;
                  _con.createTeam(_con.cricketTeam , context);
                  //  TODO : send team to server

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
                        color: saveTeam?Color(0xff317E2F):Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Save Team'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).appBarTheme.color,
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

  Widget cardView(UserTeamPlayer player) {

    ImageProvider? image1;
    if(player.image.isEmpty){
      image1 = NetworkImage(player.image);
    }
    final isCaptain = player.pid == captainId;
    final isWiseCaptain = player.pid == wiseCaptainId;

    return Card(
      child: Container(
        color: Theme.of(context).disabledColor.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:  image1 ?? AssetImage(ConstanceData.archer),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            bottomLeft: Radius.circular(2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            player.teamShortName,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 8,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffD0C1AB),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            player.shortDesignation,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 8,
                                ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.name,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    player.points,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                      if(wiseCaptainId==player.pid){
                        wiseCaptainId = "";
                      }

                      setState(() {
                        captainId = player.pid;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isCaptain ?(Theme.of(context).primaryColor):(Theme.of(context).textTheme.bodyText2!.color)!,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "C",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: isCaptain ?(Theme.of(context).primaryColor):(Theme.of(context).textTheme.bodyText2!.color)!,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "2x",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                      if(player.pid==captainId){
                        captainId = "";
                      }

                      setState(() {
                        wiseCaptainId = player.pid;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isWiseCaptain ?(Theme.of(context).primaryColor):(Theme.of(context).textTheme.bodyText2!.color)!,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "VC",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: isWiseCaptain ?(Theme.of(context).primaryColor):(Theme.of(context).textTheme.bodyText2!.color)!,
                            letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "1.5x",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
          Expanded(child: SizedBox()),
          TimeLeftText(
            widget.matchDateTime,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.6,
                  fontSize: 22,
                ),
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.help,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}
