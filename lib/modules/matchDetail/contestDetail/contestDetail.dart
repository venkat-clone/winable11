// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/modules/matchDetail/contestDetail/addCash.dart';
import 'package:newsports/modules/matchDetail/contestDetail/detail.dart';
import 'package:newsports/modules/matchDetail/contestDetail/leaderboard.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/matchDetailCardView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContestDetailPage extends StatefulWidget {
  @override
  _ContestDetailPageState createState() => _ContestDetailPageState();
}

class _ContestDetailPageState extends State<ContestDetailPage> {
  bool isleaderboard = false;
  bool isContest = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Container(
            height: AppBar().preferredSize.height,
            color: Colors.black87,
            child: appBar(),
          ),
          MatchDetailCardView(
            txt1: AppLocalizations.of('₹5 Lakhs'),
            txt2: "₹25",
            txt3: AppLocalizations.of('18,406 sports left'),
            txt4: AppLocalizations.of('26,595 spots'),
          ),
          Container(
            height: 40,
            color: Theme.of(context).appBarTheme.color,
            child: tabBar(),
          ),
          isContest == true
              ? DetailPage()
              : isleaderboard == true
                  ? LeaderboardPage()
                  : SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).textTheme.headline6!.color,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            context: context,
            builder: (context) => Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of('You have not created a group yet'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontSize: 18,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        ConstanceData.group,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of('Add friends and discuss everything sport.'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: AppLocalizations.of('Create Group'),
                  ),
                  CustomButtonBorder(
                    text: AppLocalizations.of('Cancel'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget tabBar() {
    return Row(
      children: [
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isContest = true;
              isleaderboard = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 50),
            child: Text(
              AppLocalizations.of('Contents'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isContest == true ? Theme.of(context).textTheme.headline6!.color : Colors.black38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isContest = false;
              isleaderboard = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 50),
            child: Text(
              AppLocalizations.of('My Contents (0)'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isleaderboard == true ? Theme.of(context).textTheme.headline6!.color : Colors.black38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
      ],
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
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of('SSMG vs DAE'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        fontSize: 22,
                      ),
                ),
                Text(
                  AppLocalizations.of('48m 39s left'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.6,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of('Total Balance'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "₹31",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).textTheme.headline6!.color,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCashPage(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xff317E2F),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of('Add cash'),
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            color: Colors.white,
                                            letterSpacing: 0.6,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              indent: 14,
                              endIndent: 14,
                            ),
                            row(AppLocalizations.of('Amount Added'), "₹0"),
                            row(AppLocalizations.of('Winnings'), "₹31"),
                            row(AppLocalizations.of('Cash Bonus'), "₹0"),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black12,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              FontAwesomeIcons.wallet,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget row(String txt1, String txt2) {
    return Column(
      children: [
        Container(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      txt1,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
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
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.error_outline,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 14,
          endIndent: 14,
        ),
      ],
    );
  }
}
