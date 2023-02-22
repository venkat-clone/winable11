// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/createTeam/chooseCaptain.dart';
import 'package:newsports/modules/createTeam/teamPreview.dart';
import 'package:newsports/widget/teamCardView.dart';
import 'package:flutter/material.dart';
import 'package:newsports/constance/global.dart' as globals;
import '../../constance/constance.dart';

class CreateTeamPage extends StatefulWidget {
  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  bool isWk = true;
  bool isBAT = false;
  bool isAR = false;
  bool isBowl = false;
  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of('Select 1-4 Wicket-Keepers'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.headline6!.color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.sort,
                        color: Theme.of(context).textTheme.headline6!.color,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of('SELECTE BY'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('POINTS'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('CREDITS'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              isWk == true
                  ? wk()
                  : isBAT == true
                      ? bat()
                      : isAR == true
                          ? ar()
                          : isBowl == true
                              ? bowl()
                              : SizedBox(),
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
                      builder: (context) => TeamPreViewPage(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseCaptainPage(),
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
                        color: Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Continue'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.caption!.color,
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

  Widget wk() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap1 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "BLR",
                  txt2: AppLocalizations.of('A de Villiers'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "374",
                  txt6: "10.0",
                  image1: AssetImage(ConstanceData.villiers),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap2 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('J Buttler'),
                  txt3: AppLocalizations.of('Sel by 68.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "268",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.buttler),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap3 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('S Samson'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "391",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.samson),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bat() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap4 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "BLR",
                  txt2: AppLocalizations.of('V kohli'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "374",
                  txt6: "10.0",
                  image1: AssetImage(ConstanceData.cricketerPic),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap5 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('A Finch'),
                  txt3: AppLocalizations.of('Sel by 68.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "268",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.finch),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap6 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('S Smith'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "391",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.smith),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ar() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap7 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "BLR",
                  txt2: AppLocalizations.of('B Stokes'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "374",
                  txt6: "10.0",
                  image1: AssetImage(ConstanceData.stokes),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap8 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('C Morris'),
                  txt3: AppLocalizations.of('Sel by 68.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "268",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.morris),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bowl() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap9 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "BLR",
                  txt2: AppLocalizations.of('J Archer'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "374",
                  txt6: "10.0",
                  image1: AssetImage(ConstanceData.archer),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap10 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('Y Chahal'),
                  txt3: AppLocalizations.of('Sel by 68.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "268",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.chahal),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.tap11 = true;
                  });
                },
                child: TeamCardView(
                  txt1: "RR",
                  txt2: AppLocalizations.of('D Steyn'),
                  txt3: AppLocalizations.of('Sel by 67.15%'),
                  txt4: AppLocalizations.of('Played last match'),
                  txt5: "391",
                  txt6: "9.5",
                  image1: AssetImage(ConstanceData.steyn),
                ),
              ),
            ],
          ),
        ],
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
              AppLocalizations.of('WK(0)'),
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
              AppLocalizations.of('BAT(0)'),
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
              AppLocalizations.of('AR(0)'),
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
              AppLocalizations.of('BOWL(0)'),
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
                        Text(
                          AppLocalizations.of('5h 47m left'),
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
                    AppLocalizations.of('Max 7 palyers from a team'),
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
                              AppLocalizations.of('Palyers'),
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
                                  "0",
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
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            ConstanceData.rajsthanRoyal,
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
                              "RR",
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
                              "0",
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
                              "BLR",
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
                              "0",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).appBarTheme.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            ConstanceData.banglore,
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
                              "100.0",
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
                      children: [
                        customContainer(
                          globals.tap1 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap2 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap3 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(
                          globals.tap4 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap5 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap6 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap7 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap8 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap9 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap10 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        SizedBox(
                          width: 3,
                        ),
                        customContainer(globals.tap11 == true ? Color(0xff317E2F) : (Theme.of(context).textTheme.headline6!.color)!),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.remove_circle_outline,
                          color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                          size: 22,
                        )
                      ],
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
