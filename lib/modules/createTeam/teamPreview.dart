// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

import '../../models/team_players.dart';
import '../../models/player.dart';
import '../../utils/designations.dart';

class TeamPreViewPage extends StatefulWidget {
  List<Player> players;
  TeamPreViewPage({ required this.players});

  @override
  _TeamPreViewPageState createState() => _TeamPreViewPageState();
}

class _TeamPreViewPageState extends State<TeamPreViewPage> {
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
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                        Designation.getDesignation("", 4).fullName,
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
                      children: widget.players.where((element) => element.designationId=="4").map<Widget>((Player player) {
                        Image? image;
                        if(player.image.isNotEmpty){
                          image = Image.network(player.image);
                        }
                          return playerDetail(
                            AppLocalizations.of(player.name),
                            AppLocalizations.of('9.5 Cr'),
                            image??Image.asset(
                              ConstanceData.buttler,
                              fit: BoxFit.cover,
                            ),
                            (Theme.of(context).appBarTheme.color)!,
                            (Theme.of(context).textTheme.headline6!.color)!,
                          );
                      }).toList(),
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
                        Designation.getDesignation("", 3).fullName,
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
                      children: widget.players.where((element) => element.designationId=="3").map<Widget>((Player player) {

                        Image? image;
                        if(player.image.isNotEmpty){
                          image = Image.network(player.image);
                        }

                        return playerDetail(
                          AppLocalizations.of(player.name),
                          AppLocalizations.of('9.5 Cr'),
                          image??Image.asset(
                            ConstanceData.buttler,
                            fit: BoxFit.cover,
                          ),
                          (Theme.of(context).appBarTheme.color)!,
                          (Theme.of(context).textTheme.headline6!.color)!,
                        );
                      }).toList(),
                    ),
                    Expanded(child: SizedBox()),
                    Center(
                      child: Text(
                        Designation.getDesignation("", 4).fullName,
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
                      children: widget.players.where((element) => element.designationId=="4").map<Widget>((Player player) {
                        Image? image;
                        if(player.image.isNotEmpty){
                          image = Image.network(player.image);
                        }
                        return playerDetail(
                          AppLocalizations.of(player.name),
                          AppLocalizations.of('9.5 Cr'),
                          image??Image.asset(
                            ConstanceData.buttler,
                            fit: BoxFit.cover,
                          ),
                          (Theme.of(context).appBarTheme.color)!,
                          (Theme.of(context).textTheme.headline6!.color)!,
                        );
                      }).toList(),
                    ),
                    Expanded(child: SizedBox()),
                    Center(
                      child: Text(
                        Designation.getDesignation("", 2).fullName,
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
                      children: widget.players.where((element) => element.designationId=="2").map<Widget>((Player player) {
                        Image? image;
                        if(player.image.isNotEmpty){
                          image = Image.network(player.image);
                        }
                        return playerDetail(
                          AppLocalizations.of(player.name),
                          AppLocalizations.of('9.5 Cr'),
                          image??Image.asset(
                            ConstanceData.buttler,
                            fit: BoxFit.cover,
                          ),
                          (Theme.of(context).appBarTheme.color)!,
                          (Theme.of(context).textTheme.headline6!.color)!,
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget playerDetail(String txt1, String txt2, Image image1, Color color, Color txtColor) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(height: 55, width: 55, child: image1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: color,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                      child: Text(
                        txt1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: txtColor,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    txt2,
                    softWrap: true,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).appBarTheme.color,
                          letterSpacing: 0.6,
                          fontSize: 10,
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
}
