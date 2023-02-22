// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

import '../../../../constance/constance.dart';

class TournamentLeaderBoardPage extends StatefulWidget {
  @override
  _TournamentLeaderBoardPageState createState() =>
      _TournamentLeaderBoardPageState();
}

class _TournamentLeaderBoardPageState extends State<TournamentLeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Tournament LeaderBoard'),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
                letterSpacing: 0.6,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            color: Theme.of(context).appBarTheme.color,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of('Select Toue'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    AppLocalizations.of('German Mens Handball'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).textTheme.bodyText2!.color,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 22,
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of('TEAM'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    AppLocalizations.of('RANK'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
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
                    Container(
                      height: AppBar().preferredSize.height,
                      color: Colors.indigo,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                ConstanceData.buttler,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of('PARTHD37OQR'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.white,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  AppLocalizations.of('0 Points'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.white.withOpacity(0.5),
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              "#0",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 18,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    container(
                      (Theme.of(context).appBarTheme.color)!,
                      AppLocalizations.of('Pirates of Barca'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_left,
                      Colors.green,
                      AssetImage(
                        ConstanceData.smith,
                      ),
                    ),
                    container(
                      Colors.grey.withOpacity(0.5),
                      AppLocalizations.of('S.Samson'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_right,
                      Colors.red,
                      AssetImage(
                        ConstanceData.samson,
                      ),
                    ),
                    container(
                      (Theme.of(context).appBarTheme.color)!,
                      AppLocalizations.of('A.Jaiswal'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_left,
                      Colors.green,
                      AssetImage(
                        ConstanceData.jaiswal,
                      ),
                    ),
                    container(
                      Colors.grey.withOpacity(0.5),
                      AppLocalizations.of('S.Joshi'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_right,
                      Colors.red,
                      AssetImage(
                        ConstanceData.joshi,
                      ),
                    ),
                    container(
                      (Theme.of(context).appBarTheme.color)!,
                      AppLocalizations.of('V.Villiers'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_left,
                      Colors.green,
                      AssetImage(
                        ConstanceData.villiers,
                      ),
                    ),
                    container(
                      Colors.grey.withOpacity(0.5),
                      AppLocalizations.of('M.Morris'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_right,
                      Colors.red,
                      AssetImage(
                        ConstanceData.morris,
                      ),
                    ),
                    container(
                       (Theme.of(context).appBarTheme.color)!,
                      AppLocalizations.of('A. Archer'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_left,
                      Colors.green,
                      AssetImage(
                        ConstanceData.archer,
                      ),
                    ),
                    container(
                      Colors.grey.withOpacity(0.5),
                      AppLocalizations.of('M.Siraj'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_right,
                      Colors.red,
                      AssetImage(
                        ConstanceData.siraj,
                      ),
                    ),
                    container(
                     (Theme.of(context).appBarTheme.color)!,
                      AppLocalizations.of('V.KohaliV.Kohali'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_left,
                      Colors.green,
                      AssetImage(
                        ConstanceData.cricketerPic,
                      ),
                    ),
                    container(
                      Colors.grey.withOpacity(0.5),
                      AppLocalizations.of('R.Steyn'),
                      "1,996.5 Points",
                      "#1",
                      Icons.arrow_right,
                      Colors.red,
                      AssetImage(
                        ConstanceData.steyn,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget container(Color color, String txt1, String txt2, String txt3,
      IconData icon, Color iconColor, AssetImage image) {
    return Container(
      height: AppBar().preferredSize.height,
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: image,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  txt2,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                        letterSpacing: 0.6,
                        fontSize: 10,
                      ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(
              txt3,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.headline6!.color,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
