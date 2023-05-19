

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/utils/designations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() {
    _con.getPlayerStats(context,widget.matchId);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {

    if(_con.stats.loading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if(_con.stats.error!=null){
      return Center(
        child: Text(_con.stats.error??'something went wrong'),
      );
    }
    final selected = _con.stats.value?.where((element) => element.isSelected).toList();
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: () async{
        await _con.getPlayerStats(context,widget.matchId);
        _refreshController.refreshCompleted();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            if(selected?.isEmpty == true) Expanded(child: Text('No player found')),
            Expanded(
              child: ListView.builder(
                  itemCount: selected!.length,
                  itemBuilder: (n,i){
                final element =  selected[i];
                return Column(children: [
                  playerCard(
                    element.name,
                    "",
                    element.teamShortName,
                    Designation.getDesignation(Designation.cricket, int.parse(element.designationId)).shortName,
                    element.totalPoints,
                    element.isCaptain?'C':'',
                  ),
                  Divider(),
                ],);
              }),
            ),


          ],
        ),
      ),
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
          Expanded(
            flex:12,
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
                    Text("$team${team.isNotEmpty&&designation.isNotEmpty?'-':''}$designation",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).textTheme.caption!.color,
                    )),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: Text(points,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // color: Theme.of(context).textTheme.caption!.color,
              ),
              textAlign: TextAlign.center,),
            ),
          ),
        ],

      ),
    );
  }



}


