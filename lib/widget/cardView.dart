// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/MatchModel.dart';
import 'package:newsports/modules/matchDetail/matchDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:newsports/widget/timeLeft.dart';

import '../constance/constance.dart';
import '../models/Team.dart';
import '../modules/matchDetail/myMatchDetail/myMatchDetailPage.dart';
import '../utils/utils.dart';

class CardView extends StatefulWidget {
  final MatchModel match;
  final bool notificationIcon;
  final bool clickable;
  const CardView({
    Key? key,
    required this.match,
    this.notificationIcon = false,
    this.clickable = true,

  }) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
  final match = widget.match;
    return InkWell(
      onTap: () {
        if(widget.clickable) Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchDetailPage(
              match: widget.match,
              //my_contests: false,
              //my_teams: false,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                // height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(kDebugMode) CopyText(text:widget.match.matchId),

                      SizedBox(height: 2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                match.competitionName,
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).textTheme.caption!.color,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                                overflow: TextOverflow.fade,
                              ),
                              flex: 10,
                            ),
                            // Expanded(child: SizedBox(),flex: 2,),
                            if(widget.notificationIcon)
                              Expanded(child: Icon(Icons.notifications_on_outlined),flex: 1,)
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        match.team1.teamName,
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                              color: Theme.of(context).textTheme.caption!.color,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.6,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        match.team2.teamName,
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                              color: Theme.of(context).textTheme.caption!.color,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.6,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      match.team1.teamImage,
                                      fit: BoxFit.cover,
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                            ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    match.team1.teamShortName,
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      TimeLeftText(
                                        match.matchDateTime,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(Utils.getDaySpecificDate(DateTime.parse(match.matchDateTime)),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    match.team2.teamShortName,
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      match.team2.teamImage,
                                      fit: BoxFit.cover,
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      // Divider(),
                      SizedBox(height: 5,),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   '1 Team',
                              //   style: Theme.of(context).textTheme.caption!.copyWith(
                              //         color: Theme.of(context).primaryColor,
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 0.6,
                              //         fontSize: 14,
                              //       ),
                              // ),
                              ...match.getContestTypes.map((s){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    height: 25,
                                    padding: const EdgeInsets.symmetric(horizontal: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        s,
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.outbox,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class CompleteCardView extends StatefulWidget {
  final MatchModel match;

  CompleteCardView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  _CompleteCardViewState createState() => _CompleteCardViewState();
}
class _CompleteCardViewState extends State<CompleteCardView> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyMatchDetailPage(
              match: widget.match,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(kDebugMode) CopyText(text:widget.match.matchId),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(widget.match.competitionName),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).textTheme.caption!.color,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.notifications_on_outlined)
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(widget.match.team1.teamName??""),
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        AppLocalizations.of(widget.match.team2.teamName??""),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      widget.match.team1.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team1.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        widget.match.team1Score??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(Utils.getDaySpecificDate(DateTime.parse(widget.match.matchDateTime)),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).textTheme.caption!.color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team2.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        widget.match.team2Score??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      widget.match.team2.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.match.matchStatusNote,
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              // Container(
                              //   height: 25,
                              //   width: 60,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(4),
                              //     border: Border.all(
                              //       color: Theme.of(context).primaryColor,
                              //     ),
                              //   ),
                              //   child: Center(
                              //     child: Text(
                              //       AppLocalizations.of('Mega'),
                              //       style: Theme.of(context).textTheme.caption!.copyWith(
                              //         color: Theme.of(context).primaryColor,
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 0.6,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Expanded(child: SizedBox()),
                              // Icon(
                              //   Icons.outbox,
                              //   color: Theme.of(context).primaryColor,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LiveSliderCardView extends StatefulWidget {
  final MatchModel match;
  final bool showMyData;
  LiveSliderCardView({
    Key? key,
    required this.match,
    this.showMyData = true,
  }) : super(key: key);

  @override
  _LiveSliderCardViewState createState() => _LiveSliderCardViewState();
}
class _LiveSliderCardViewState extends State<LiveSliderCardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onLongPress: kDebugMode?(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchDetailPage(
              match: widget.match,
              my_contests: true,
              my_teams: true,
            ),
          ),
        );
      }:null,

      onTap: () {


        final dateTime = DateTime.parse(widget.match.matchDateTime);
        final _timeLeft = dateTime.difference(DateTime.now());
        if(_timeLeft.isNegative ) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyMatchDetailPage(
                match: widget.match,
                  showMyData:widget.showMyData
              ),
            ),
          );
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetailPage(
               // my_contests: true,
                match: widget.match,
                //my_teams: true,
              ),
            ),
          );
        }


      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(kDebugMode) CopyText(text:widget.match.matchId),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(widget.match.competitionName),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).textTheme.caption!.color,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.4,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.notifications_on_outlined)
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(widget.match.team1.teamName??""),
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        AppLocalizations.of(widget.match.team2.teamName??""),
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                      widget.match.team1.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team1.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                        AppLocalizations.of(widget.match.team1Score??""),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    DateFormat('d MMM y').format(DateTime.parse(widget.match.matchDateTime)),
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                      // color: Theme.of(context).textTheme.caption!.color,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team2.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                        AppLocalizations.of(widget.match.team2Score??""),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                      widget.match.team2.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 10,
                            //     right: 10,
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Expanded(
                            //         child: Text(
                            //           AppLocalizations.of(widget.match.team1Score??""),
                            //           style: Theme.of(context).textTheme.caption!.copyWith(
                            //             color: Theme.of(context).textTheme.caption!.color,
                            //             fontWeight: FontWeight.bold,
                            //             letterSpacing: 0.6,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(width: 10,),
                            //       Expanded(
                            //         child: Align(
                            //           alignment: Alignment.centerRight,
                            //           child: Text(
                            //             AppLocalizations.of(widget.match.team2Score??""),
                            //             textAlign: TextAlign.end,
                            //             style: Theme.of(context).textTheme.caption!.copyWith(
                            //               color: Theme.of(context).textTheme.caption!.color,
                            //               fontWeight: FontWeight.bold,
                            //               letterSpacing: 0.6,
                            //               fontSize: 12,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.match.matchStatusNote,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              // Container(
                              //   height: 25,
                              //   width: 60,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(4),
                              //     border: Border.all(
                              //       color: Theme.of(context).primaryColor,
                              //     ),
                              //   ),
                              //   child: Center(
                              //     child: Text(
                              //       AppLocalizations.of('Mega'),
                              //       style: Theme.of(context).textTheme.caption!.copyWith(
                              //         color: Theme.of(context).primaryColor,
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 0.6,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Expanded(child: SizedBox()),
                              // Icon(
                              //   Icons.outbox,
                              //   color: Theme.of(context).primaryColor,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class FeedCardView extends StatefulWidget {
  final MatchModel match;

  FeedCardView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  _FeedCardViewState createState() => _FeedCardViewState();
}

class _FeedCardViewState extends State<FeedCardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Commentary(
        //       match: widget.match,
        //     ),
        //   ),
        // );
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(kDebugMode) CopyText(text:widget.match.matchId),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(widget.match.competitionName),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).textTheme.caption!.color,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.4,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.notifications_on_outlined)
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(widget.match.team1.teamName??""),
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        AppLocalizations.of(widget.match.team2.teamName??""),
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                      widget.match.team1.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team1.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                        AppLocalizations.of(widget.match.team1Score??""),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    "Live",
                                    // DateFormat('d MMM y').format(DateTime.parse(widget.match.matchDateTime)),
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                      // color: Theme.of(context).textTheme.caption!.color,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      Text(
                                        widget.match.team1.teamShortName??"",
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                        AppLocalizations.of(widget.match.team1Score??""),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                      widget.match.team2.teamImage??"",
                                      errorBuilder: (c,o,s){
                                        return Image.asset(
                                          ConstanceData.appLogo,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 10,
                            //     right: 10,
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Expanded(
                            //         child: Text(
                            //           AppLocalizations.of(widget.match.team1Score??""),
                            //           style: Theme.of(context).textTheme.caption!.copyWith(
                            //             color: Theme.of(context).textTheme.caption!.color,
                            //             fontWeight: FontWeight.bold,
                            //             letterSpacing: 0.6,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(width: 10,),
                            //       Expanded(
                            //         child: Align(
                            //           alignment: Alignment.centerRight,
                            //           child: Text(
                            //             AppLocalizations.of(widget.match.team2Score??""),
                            //             textAlign: TextAlign.end,
                            //             style: Theme.of(context).textTheme.caption!.copyWith(
                            //               color: Theme.of(context).textTheme.caption!.color,
                            //               fontWeight: FontWeight.bold,
                            //               letterSpacing: 0.6,
                            //               fontSize: 12,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.match.matchStatusNote,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              // Container(
                              //   height: 25,
                              //   width: 60,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(4),
                              //     border: Border.all(
                              //       color: Theme.of(context).primaryColor,
                              //     ),
                              //   ),
                              //   child: Center(
                              //     child: Text(
                              //       AppLocalizations.of('Mega'),
                              //       style: Theme.of(context).textTheme.caption!.copyWith(
                              //         color: Theme.of(context).primaryColor,
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 0.6,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Expanded(child: SizedBox()),
                              // Icon(
                              //   Icons.outbox,
                              //   color: Theme.of(context).primaryColor,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CopyText extends StatelessWidget {
  String text;
  CopyText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Clipboard.setData(ClipboardData(text: text));

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Id copied'))
          );

        },
        child: Text(text));
  }
}


