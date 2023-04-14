import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


import '../../../base_classes/value_state.dart';
import '../../../controllers/FeedController.dart';
import '../../../models/commentary/BatsMen.dart';
import '../../../models/commentary/Bowlers.dart';
import '../../../models/commentary/Inning.dart';
import '../../../models/commentary/MatchComentry.dart';

class ScoreBoard extends StatefulWidget {

  final FeedController feedController ;
  final String matchId ;

  // Inning? inning1;
  // Inning? inning2;

  ScoreBoard({Key? key,
  required this.feedController,
  required this.matchId,
  // required this.inning2,
  }) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState(feedController);
}

class _ScoreBoardState extends StateMVC<ScoreBoard> {

  late FeedController _con ;

  _ScoreBoardState(FeedController con):super(con){
    _con = controller as FeedController ;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() {
    _con.getMatchCommentary(context, widget.matchId,inning: "1");
    _con.getMatchCommentary(context, widget.matchId,inning: "2");
    return super.initAsync();
  }



  @override
  Widget build(BuildContext context) {

    if(_con.inning1Commentary.loading && _con.inning1Commentary.loading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if(_con.inning1Commentary.error!=null && _con.inning1Commentary.error!=null){
      return Center(
        child: Text("Please try again later"),
      );
    }



    return Container(
      child: ListView(
        children: [
          teamInnings(_con.inning1Commentary),
          teamInnings(_con.inning2Commentary),
        ],
      ),
    );
  }

  Widget teamInnings(ValueState<MatchCommentary> match){
    if(match.value ==null)
      return Text("");
    final inning = match.value!.inning;
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(inning.name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(

            )),
          ),
          Text("${inning.scoresFull.replaceAll("ov", "")}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(

          )),
        ],
      ),
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              /// BatsMan
              rowHead("Batter","R","B","4s","6s","S/R"),
              Divider(),
              ...inning.batsmen.map((player) {
                return batsmanRow(player);
              }),
              rowHead("Bowler","O","M","R","W","Eco"),
              Divider(),
              ...inning.bowlers.map((player) {
                return bowlerRow(player);
              }),
            ],
          ),
        )
      ],
    );
  }


  Widget batsmanRow(Batsmen batsmen)=>
      widgetRow(
        batsmen.name,
        batsmen.howOut,
        batsmen.runs,
        batsmen.ballsFaced,
        batsmen.fours,
        batsmen.sixes,
        batsmen.strikeRate,
        hilightIndex: 0
      );
  Widget bowlerRow(Bowlers batsmen)=>
      widgetRow(
        batsmen.name,
        "",
        batsmen.overs,
        batsmen.maidens,
        batsmen.run0,
        batsmen.wickets,
        batsmen.econ,
        hilightIndex: 3
      );

  Widget widgetRow(
      String playerName,
      String howOut,
      String st1,
      String st2,
      String st3,
      String st4,
      String last,
      {int hilightIndex =-1
      }
      ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(playerName,style: Theme.of(context).textTheme.titleSmall!.copyWith(
              // color: Theme.of(context).textTheme.caption!.color,
            )),
                Text(howOut,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).textTheme.caption!.color,
                )),
              ],
            ),
          ),
          ...[st1,st2,st3,st4].map((e) => Expanded(
            flex: 1,
            child: Text(e,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // color: Theme.of(context).textTheme.caption!.color,
              ),),
          )),
          Expanded(
            flex: 2,
            child: Text(last,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // color: Theme.of(context).textTheme.caption!.color,
              ),),
          )

        ],
      ),
    );
  }


  Widget rowHead(
      String playerName,
      String st1,
      String st2,
      String st3,
      String st4,
      String last,){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(playerName,style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),),
          ),
          ...[st1,st2,st3,st4].map((e) => Expanded(
            flex: 1,
            child: Text(e,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).textTheme.caption!.color,
              ),),
          )),
          Expanded(
            flex: 2,
            child: Text(last,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).textTheme.caption!.color,
              ),),
          )




        ],
      ),
    );
  }

}
