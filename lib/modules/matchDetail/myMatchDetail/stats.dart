import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../controllers/FeedController.dart';


class Stats extends StatefulWidget {

  final FeedController feedController ;
  final String matchId ;
  Stats({Key? key,required this.feedController,required this.matchId}) : super(key: key);

  @override
  StateMVC<Stats> createState() => _StatsState(feedController);
}

class _StatsState extends StateMVC<Stats> {

  late FeedController _con ;

  _StatsState(FeedController con):super(con){
    _con = controller as FeedController ;
  }



  @override
  Widget build(BuildContext context) {

    // if(_con.inning1Commentary.loading && _con.inning1Commentary.loading){
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    //
    // if(_con.inning1Commentary.error!=null && _con.inning1Commentary.error!=null){
    //   return Center(
    //     child: Text("Please try again later"),
    //   );
    // }

    return ListView(
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            Text("PLAYERS",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).textTheme.caption!.color,
                )
            ),
            Expanded(
                flex: 10,
                child: SizedBox()),
            Expanded(
              flex: 3,
              child: Text("POINTS",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).textTheme.caption!.color,
                  )
              ),
            ),
          ],
        ),
        Divider(),
        playerCard(
          "MS Dhoni",
          "CSK",
          "",
          "WK",
          "140",
          "c",
        ),
        Divider(),
        playerCard(
          "Vrat Kohili",
          "RCB",
          "",
          "BAT",
          "10",
          "CV",
        ),
        Divider(),
        playerCard(
          "Kris Gails",
          "SRH",
          "",
          "ALL",
          "0",
          "",
        ),


      ],
    );
  }




  playerCard(
      String name,
      String team,
      String image,
      String designation,
      String points,
      String captainString
      ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Stack(
              children: [
              if(captainString.isNotEmpty) Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(captainString.toUpperCase(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10
                      // color: Theme.of(context).textTheme.caption!.color,
                    )),
                  ),
                ),
              )
              ],

            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // color: Theme.of(context).textTheme.caption!.color,
              ),),
              Text("$team-$designation",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).textTheme.caption!.color,
              )),
            ],
          ),
          Expanded(
              flex: 10,
              child: SizedBox()),
          Expanded(
            flex: 4,
            child: Text(points,style: Theme.of(context).textTheme.titleSmall!.copyWith(
              // color: Theme.of(context).textTheme.caption!.color,
            ),
            textAlign: TextAlign.center,),
          ),
        ],

      ),
    );
  }



}


