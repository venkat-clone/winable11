import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';

import '../../../controllers/MatchController.dart';

class CompletedPage extends StatefulWidget {
  @override
  _CompletedPageState createState() => _CompletedPageState();
}

class _CompletedPageState extends StateMVC<CompletedPage> {
  late MatchController _con ;
  final scrollController  = ScrollController();
  _CompletedPageState():super(MatchController()){
    _con = controller as MatchController;
  }

  @override
  void initState() {
    super.initState();
    _con.getMatches(context);
    _con.getTeams(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: _con.matchList.length,
        itemBuilder: (c,index){
          final match = _con.matchList[index];
          final teamA = _con.teams[match.teamid1];
          final teamB = _con.teams[match.teamid2];

          return CompleteCardView(
            txt1: AppLocalizations.of(match.title),
            txt2: AppLocalizations.of(teamA?.teamName??""),
            txt3: AppLocalizations.of(teamB?.teamName??""),
            txt4: teamA?.teamShortName??"",
            txt5: AppLocalizations.of('Completed'),
            txt6: teamB?.teamShortName??"",
            txt7: AppLocalizations.of('1 Team'),
            image1: Image.network(
                teamA?.teamImage??"",
            ),
            image2: Image.network(
                teamB?.teamImage??"",
            ),
          );

          return CardView(
            txt1: AppLocalizations.of(match.title),
            txt2: AppLocalizations.of(teamA?.teamName??""),
            txt3: AppLocalizations.of(teamB?.teamName??""),
            txt4: teamA?.teamShortName??"",
            // setTime: CountdownTimer(
            //   endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
            //   textStyle: TextStyle(
            //     fontSize: 14,
            //     color: Colors.red,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            setTime: Text(match.matchDateTime,
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            txt6: teamB?.teamShortName??"",
            txt7: AppLocalizations.of('1 Team'),
            image1: Image.network(
              teamA?.teamImage??"",
              fit: BoxFit.cover,
            ),
            image2: Image.network(
              teamB?.teamImage??"",
              fit: BoxFit.cover,
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 15,),
      ),
    );
  }
}
