// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/profile/tournamentLeaderboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constance/constance.dart';
import '../../../../utils/value_notifiers.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              expandedHeight: 180.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Expanded(child: SizedBox()),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        FirebaseAuth.instance.currentUser
                                                ?.photoURL ??
                                            "",
                                      ),
                                      child: FirebaseAuth.instance.currentUser
                                                  ?.photoURL ==
                                              null
                                          ? Text(user!.displayName
                                              .toString()[0]
                                              .toUpperCase())
                                          : SizedBox(),
                                    ),
                                    InkWell(
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            Theme.of(context).appBarTheme.color,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      user?.displayName ?? " ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.white,
                                            letterSpacing: 0.6,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of('Level'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                    ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of('Level'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                    ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "12",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: LinearPercentIndicator(
                        percent: 0.0,
                        progressColor: Colors.yellow,
                        backgroundColor: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            AppLocalizations.of(
                                'To progress to a level 13 Champion'),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .color,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of('Play for'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "₹6",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  AppLocalizations.of('more'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              AppLocalizations.of('OR'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of('Play for'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        fontSize: 12,
                                      ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "₹6",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  AppLocalizations.of('more'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.trophy,
                                        size: 60,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "₹15",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .color,
                                                  letterSpacing: 0.6,
                                                  fontSize: 22,
                                                ),
                                          ),
                                          Text(
                                            AppLocalizations.of('Cash Bonus'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .color,
                                                  letterSpacing: 0.6,
                                                  fontSize: 12,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            AppLocalizations.of(
                                                'Use this cash bonus to join paid contests\nand win.'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .color,
                                                  letterSpacing: 0.6,
                                                  fontSize: 10,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40,
                                        color: Color(0xffFAFAFA),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(
                                                'Offer Details'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  letterSpacing: 0.6,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 40,
                                        color: Color(0xffFAEDE3),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.lock,
                                                color: Colors.orange,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                AppLocalizations.of(
                                                    'Unlocks at level 20'),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.6,
                                                      fontSize: 12,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "0",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.blue,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              AppLocalizations.of('Followers'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          width: 1,
                          color: Theme.of(context).disabledColor,
                        ),
                        Column(
                          children: [
                            Text(
                              "0",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.blue,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              AppLocalizations.of('Following'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          width: 1,
                          color: Theme.of(context).disabledColor,
                        ),
                        Column(
                          children: [
                            Text(
                              "0",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.blue,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              AppLocalizations.of('Posts'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
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
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Text(
                          AppLocalizations.of('Playing History'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          column(
                            Icons.dock_outlined,
                            Colors.orange,
                            currentUser.value.contests.toString(),
                            AppLocalizations.of('Contests'),
                          ),
                          column(
                            Icons.backup_sharp,
                            Colors.blue,
                            currentUser.value.matches.toString(),
                            AppLocalizations.of('Matches'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          column(
                            Icons.badge,
                            Colors.green,
                            currentUser.value.series.toString(),
                            AppLocalizations.of('Series'),
                          ),
                          column(
                            FontAwesomeIcons.trophy,
                            Colors.orange,
                            currentUser.value.wins.toString(),
                            AppLocalizations.of('Wins'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).appBarTheme.color,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TournamentLeaderBoardPage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of('Tournament Leaderboard'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 16,
                                      ),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.arrow_forward_ios,
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget column(IconData icon, Color iconColor, txt1, txt2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          txt1,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Theme.of(context).textTheme.headline6!.color,
                letterSpacing: 0.6,
                fontSize: 14,
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
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
