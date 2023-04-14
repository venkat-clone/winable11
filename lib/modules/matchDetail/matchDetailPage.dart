
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/ContestController.dart';
import 'package:newsports/modules/createTeam/createTeam.dart';
import 'package:newsports/modules/filter/filter.dart';
import 'package:newsports/modules/matchDetail/contestDetail/addCash.dart';
import 'package:newsports/modules/matchDetail/contests.dart';
import 'package:newsports/modules/matchDetail/myContests.dart';
import 'package:newsports/modules/matchDetail/myTeam.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/TeamController.dart';
import '../../models/MatchModel.dart';
import '../../models/Team.dart';
import '../../utils/utils.dart';
import '../../widget/timeLeft.dart';

class MatchDetailPage extends StatefulWidget {
  final MatchModel match;
  MatchDetailPage({
    required this.match,
  });

  @override
  _MatchDetailPageState createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends StateMVC<MatchDetailPage> {

  late ContestController _con;
  TeamController teamController = TeamController();
  _MatchDetailPageState():super(ContestController()){
    _con = controller as ContestController;
  }

  bool isContests = true;
  bool isMyContests = false;
  bool isMyTeams = false;

  static final List<double> entryList =[1,50,100,1000];
  final entryMap =entryList.asMap().entries;

  static final List<double> prizePoolList =[1,10000,100000,1000000,2500000];

  int selectedPrizePool = -1;
  int selectedEntry = -1;

  Pair<double,double>? entryFilter;
  Pair<double,double>? prizePollFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isMyContests
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Icon(
                Icons.message,
                color: Colors.white,
                size: 25,
              ),
            )
          : SizedBox(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: AppBar().preferredSize.height,
                color: Theme.of(context).primaryColor,
                child: Padding(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of('${widget.match.team1.teamShortName} vs ${widget.match.team2.teamShortName}'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                            ),
                            TimeLeftText(
                              widget.match.matchDateTime,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        FontAwesomeIcons.trophy,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            context: context,
                            builder: (BuildContext context) => Card(
                              color: Theme.of(context).appBarTheme.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Container(
                                height: 230,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).appBarTheme.color,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .color,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80,
                                          ),
                                          Text(
                                            AppLocalizations.of(
                                                'Set Reminders'),
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
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        AppLocalizations.of(
                                            'Lineup Announcement (if available)'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
                                              letterSpacing: 0.6,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey.withOpacity(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(
                                                  'Match - KXIP vs DC'),
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
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey.withOpacity(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(
                                                  'Tour - Fantanccy IPL'),
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
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .disabledColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color(0xff317E2F),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of('Done'),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      letterSpacing: 0.6,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                           showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Theme.of(context).appBarTheme.color,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            AppLocalizations.of(
                                                'Total Balance'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .color,
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
                                            "₹0",
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
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddCashPage(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xff317E2F),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  AppLocalizations.of(
                                                      'Add cash'),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        letterSpacing: 0.6,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                        row(AppLocalizations.of('Amount Added'),
                                            "₹0"),
                                        row(AppLocalizations.of('Winnings'),
                                            "₹0"),
                                        row(AppLocalizations.of('Cash Bonus'),
                                            "₹0"),
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
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
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
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
                child: tabBar(),
              ),
              isContests
                  ? Column(
                      children: [
                        Container(
                          child: secondRow(),
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  : SizedBox(),
              isContests
                  ? Expanded(child: ContestsPage(match: widget.match,con: _con,entryFilter: entryFilter,prizePollFilter: prizePollFilter,))
                  : isMyContests
                      ? Expanded(child: MyContestsPage(match: widget.match,con: _con,))
                      : isMyTeams
                          ? Expanded(child: MyTeamPage(match: widget.match,con: teamController,))
                          : SizedBox(),
            ],
          ),
          isMyContests == false
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateTeamPage(match: widget.match)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color(0xff317E2F),
                            )),
                        child: Center(
                          child: Text(
                            AppLocalizations.of('Create Team'),
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
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget secondRow() {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 8),
        child: Row(
          children: [
            Text(
              AppLocalizations.of('Sort by'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.bodyText2!.color,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
            SizedBox(
              width: 15,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  AppLocalizations.of('Entry Fee'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  AppLocalizations.of('Contest Size'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilterPage(
                        selectedPrizePool:selectedPrizePool,
                        selectedEntry:selectedEntry,
                      save: (selectedEntry,selectedPrizePool){
                      Navigator.of(context).pop();
                      this.selectedEntry = selectedEntry;
                      this.selectedPrizePool = selectedPrizePool;
                      if(selectedEntry!=-1){
                        entryFilter = Pair(entryList[selectedEntry], selectedEntry+1<entryList.length?entryList[selectedEntry+1]:double.infinity);
                      }
                      if(selectedPrizePool!=-1){
                        prizePollFilter = Pair(prizePoolList[selectedPrizePool], selectedPrizePool+1<prizePoolList.length?prizePoolList[selectedPrizePool+1]:-1);
                      }

                      setState(() {

                      });
                      _con.successSnackBar("Filter applied successfully ", context);
                    },)));
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of('All Filters'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.sort,
                    size: 18,
                  )
                ],
              ),
            )
          ],
        ));
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
              isContests = true;
              isMyTeams = false;
              isMyContests = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Text(
              AppLocalizations.of('Contests'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isContests == true
                        ? Theme.of(context).textTheme.headline6!.color
                        : Colors.black38,
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
              isContests = false;
              isMyTeams = false;
              isMyContests = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              AppLocalizations.of('My Contests '),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isMyContests == true
                        ? Theme.of(context).textTheme.headline6!.color
                        : Colors.black38,
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
              isContests = false;
              isMyTeams = true;
              isMyContests = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of('My Teams'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: isMyTeams == true
                            ? Theme.of(context).textTheme.headline6!.color
                            : Colors.black38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
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
                            color: Theme.of(context).textTheme.bodyText2!.color,
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


class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  const Pair(this.first, this.second);

  @override
  String toString() => '($first, $second)';
}

