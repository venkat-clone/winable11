// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

import '../../models/Team.dart';
import '../../models/team_players.dart';
import '../../models/player.dart';
import '../../utils/designations.dart';
import '../../utils/utils.dart';

class TeamPreViewPage extends StatefulWidget {
  TeamPlayers team;
  Team team1;
  Team team2;
  bool show = true;
  String sport;
  TeamPreViewPage({ required this.team,required this.team1,required this.team2,this.show = true,this.sport ="Cricket"});

  @override
  _TeamPreViewPageState createState() => _TeamPreViewPageState();
}

class _TeamPreViewPageState extends State<TeamPreViewPage> {



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ConstanceData.cricketGround),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.show)
                    Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.team.teamName,style:Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                              )),
                              Text('Total Points: ${widget.team.points}',style:Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).appBarTheme.color,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      Designation.getDesignation(widget.sport, 1).fullName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: widget.team.players.where((element) => element.designationId=="1").map<Widget>((Player player) =>playerDetail(player)).toList(),
                    // children: [
                    //   playerDetail(
                    //     AppLocalizations.of('J.Buttler'),
                    //     AppLocalizations.of('9.5 Cr'),
                    //     Image.asset(
                    //       ConstanceData.buttler,
                    //       fit: BoxFit.cover,
                    //     ),
                    //     (Theme.of(context).appBarTheme.color)!,
                    //     (Theme.of(context).textTheme.headline6!.color)!,
                    //   ),
                    //   playerDetail(
                    //     AppLocalizations.of('S.Samson'),
                    //     AppLocalizations.of('9.5 Cr'),
                    //     Image.asset(
                    //       ConstanceData.samson,
                    //       fit: BoxFit.cover,
                    //     ),
                    //     (Theme.of(context).appBarTheme.color)!,
                    //     (Theme.of(context).textTheme.headline6!.color)!,
                    //   ),
                    //   playerDetail(
                    //     AppLocalizations.of('A. Rawats'),
                    //     AppLocalizations.of('8 Cr'),
                    //     Image.asset(
                    //       ConstanceData.rawat,
                    //       fit: BoxFit.cover,
                    //     ),
                    //     (Theme.of(context).appBarTheme.color)!,
                    //     (Theme.of(context).textTheme.headline6!.color)!,
                    //   ),
                    // ],
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      Designation.getDesignation(widget.sport, 3).fullName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: widget.team.players.where((element) => element.designationId=="3").map<Widget>((Player player) =>playerDetail(player)).toList(),
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      Designation.getDesignation(widget.sport, 4).fullName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: widget.team.players.where((element) => element.designationId=="4").map<Widget>((Player player) =>playerDetail(player)).toList(),
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      Designation.getDesignation(widget.sport, 2).fullName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: widget.team.players.where((element) => element.designationId=="2").map<Widget>((Player player) {
                      return playerDetail(player);
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  false ? Expanded(
                    child: Container(
                      color: Colors.black38,
                      child: Row(
                        children: [
                          TeamColors(widget.team1),
                          TeamColors(widget.team2),
                        ],
                      ),
                    ),
                  ):SizedBox(height: 30,)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget playerDetail(Player player) {
    Image? image;
    if(Utils.isImageURL(player.image)){
      image = Image.network(player.image,errorBuilder: (c,e,s){
        return Image.asset(
          ConstanceData.buttler,
          fit: BoxFit.cover,
          color: Colors.grey.withOpacity(0.7),
        );
      },);
    }
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                alignment: Alignment.center,
                height: 55, width: 55, child: image??Image.asset(
                ConstanceData.buttler,
                fit: BoxFit.cover,
                color: Colors.grey.withOpacity(0.7),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: player.teamId==widget.team1.teamId?Colors.white:player.teamId==widget.team2.teamId? Colors.black: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                      child: Text(
                        player.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: player.teamId==widget.team1.teamId?Colors.black:player.teamId==widget.team2.teamId? Colors.white: Colors.black,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    'Pts '+player.points,
                    softWrap: true,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).appBarTheme.color,
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget TeamColors(Team team){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            margin : const EdgeInsets.all(4.0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: team.teamId==widget.team1.teamId?Colors.white:team.teamId==widget.team2.teamId? Colors.black: Colors.white,
            ),
          ),
          Text(team.teamShortName,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white
          ),),
        ],
      ),
    );
  }

}
