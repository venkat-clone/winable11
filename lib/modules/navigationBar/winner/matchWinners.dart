import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/controllers/winnerController.dart';
import 'package:newsports/widget/cardView.dart';

import '../../../models/MatchModel.dart';
import '../../../models/MatchWinner.dart';
import '../../../models/Team.dart';
import '../../../models/winner.dart';
import '../../../utils/utils.dart';

class MatchWinnersPage extends StatefulWidget {

  MatchModel match;
  MatchWinnersPage({
    Key? key,
    required this.match
  }) : super(key: key);

  @override
  StateMVC<MatchWinnersPage> createState() => _MatchWinnersPageState();
}

class _MatchWinnersPageState extends StateMVC<MatchWinnersPage> {

  int selectedIndex = 0;


  late WinnerController _con;

  _MatchWinnersPageState():super(WinnerController()){
    _con = controller as WinnerController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() async{
    await _con.getSport();
    await _con.getMatchWinners(widget.match.matchId);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Winners"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardView(match: widget.match,
              clickable: false,
              ),
            ),
            // Row(
            //   children: List.generate(_con.winnerContest.value?.length??0, (index)
            //   {
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: InkWell(
            //                 onTap: () {
            //                   setState(() {
            //                     selectedIndex = index;
            //                   });
            //                 },
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       color: selectedIndex==index?Colors.black:Theme.of(context).disabledColor,
            //                       borderRadius: BorderRadius.circular(50)),
            //                   padding: EdgeInsets.symmetric(
            //                       vertical: 8, horizontal: 14),
            //                   child: Text("₹${_con.winnerContest.value![index].prizePool} Contest",style:Theme.of(context).textTheme.titleMedium!.copyWith(
            //                       color: selectedIndex!=index?Colors.black:Colors.white
            //                   )),
            //                 ),
            //               ),
            //             );
            //           }),
            // ),



            // if((_con.winnerContest.value?.length??0) >=1)
            // Expanded(
            //     child: ListView.builder(
            //       itemCount: _con.winnerContest.value![selectedIndex].winners.length,
            //       itemBuilder: (c,i)=>WinnerCard(winner: _con.winnerContest.value![selectedIndex].winners[i],),
            //     )),

            //   ...?_con.winnerContest.value?[selectedIndex].winners.map((e) => WinnerCard(winner: e,)),
            if(_con.winnerContest.loading)
              Expanded(child: Center(child: CircularProgressIndicator(),)),
            if(!_con.winnerContest.loading && (_con.winnerContest.value?.length??0) <1 && false)
              Expanded(child: Center(child: Text("no contest for this match"),)),
            if((_con.winnerContest.value?.length??0) >=1 && _con.winnerContest.value![selectedIndex].winners.length==0 && false )
              Expanded(child: Center(child: Text("no winners for this contest"),)),
            if((_con.winnerContest.value?.length??0) >=1)
            Expanded(child: ListView.builder(
              itemCount: _con.winnerContest.value!.length,
                itemBuilder: (c,i){
                final contest = _con.winnerContest.value![i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(contest.contest.contestName,
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),)),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text("${contest.contest.winners} Winners",style: Theme.of(context).textTheme.caption!.copyWith(
                              // color: Colors.white,
                              letterSpacing: 0.6,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                              Text(
                                '₹${Utils.convertToIndianCurrency(double.parse(contest.contest.prizePool))}',
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  // color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],),
                          Divider(),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Top Winners",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  // color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),)),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              itemCount: contest.winners.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final winner = contest.winners[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Text('${winner.rank} Rank',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.bold,

                                    ),),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Image.network(winner.image),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(winner.name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      ),),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text("won ₹${double.parse(winner.winingAmount).toStringAsPrecision(3)}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      ),),
                                    )
                                  ],
                                ),
                              );
                            },),
                          ),

                        ],
                      ),
                    ),
                ),
              );
            })),

          ],
        ),
      ),
    );
  }


}


class WinnerCard extends StatelessWidget {
  Winner winner;
  WinnerCard({Key? key,required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                        child: Image.network(winner.image,errorBuilder: (e,o,s){
                          return Text(winner.name[0].toUpperCase());
                        },),
                  )),
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(winner.name,style: Theme.of(context).textTheme.bodyLarge!.copyWith(

                      )),
                    ],
                  )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text("Rank",style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8)
                      ),),
                      Text("#${winner.rank}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Amount Won",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8)
                      ),),
                      Text("₹${double.parse(winner.winingAmount).toStringAsPrecision(3)}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                      )),
                    ],
                  ),

                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
