// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/WalletController.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/modules/matchDetail/contestDetail/contestDetail.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../utils/utils.dart';

class MatchDetailCardView extends StatelessWidget {
  final MatchModel match;
  final Contest contest;
  const MatchDetailCardView({
    Key? key,
    required this.contest,
    required this.match,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContestDetailPage(contest: contest,match: match,),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of('Prize Pool'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 10,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('Entry'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      '₹${Utils.convertToIndianCurrency(int.parse(contest.prizePool))}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(child: SizedBox()),

                      InkWell(
                      onTap: (){
                        if(match.isStarted){
                          return;
                        }
                        /// check kyc
                        ///  show dialog for payment
                        ///

                        showDialog(context: context, builder: (context)=>
                            JoinContestCard(fee: double.parse(contest.entry),contestId: contest.contestId,),
                          barrierDismissible: false,

                        );
                      },
                      child: Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                            color: !match.isStarted? Theme.of(context).primaryColor:
                            Theme.of(context).disabledColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text(
                            "₹${contest.entry}",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
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
              LinearPercentIndicator(
                percent: (double.parse(contest.joinTeam)/double.parse(contest.totalTeam)),
                progressColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      '${int.parse(contest.totalTeam)-int.parse(contest.joinTeam)} sports left',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Color(0xffD30001),
                            letterSpacing: 0.6,
                            fontSize: 10,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('${contest.totalTeam} spots'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black54,
                            letterSpacing: 0.6,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
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
                      Text(
                        AppLocalizations.of('₹1 Lakh'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.caption!.color,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text((double.parse(contest.joinTeam)/double.parse(contest.totalTeam)*100).toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.caption!.color,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('Upto ${contest.winners} Entries'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.caption!.color,
                              letterSpacing: 0.6,
                              fontSize: 10,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).textTheme.caption!.color,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JoinContestCard extends StatefulWidget {
  final double fee;
  final String contestId;
  JoinContestCard({Key? key, required this.fee,required this.contestId}) : super(key: key);

  @override
  StateMVC<JoinContestCard> createState() => _JoinContestCardState();
}

class _JoinContestCardState extends StateMVC<JoinContestCard> {

  late WalletController _con;
  _JoinContestCardState():super(WalletController()){
    _con = controller as WalletController;
  }

  @override
  void initState() {

    super.initState();
  }
  @override
  Future<bool> initAsync() {

    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CONFORMATION",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color,
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                          Text("Amount Added (Unutilised) + Winnings = ₹${_con.totalBalance}",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),),
                        ],
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                          child: Icon(Icons.cancel_outlined)
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //   Text("Entry", style: Theme.of(context).textTheme.caption!.copyWith(
                  //     color: Theme.of(context).textTheme.headline6!.color,
                  //     letterSpacing: 0.6,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   ),
                  //     Text("₹${0}", style: Theme.of(context).textTheme.caption!.copyWith(
                  //     color: Theme.of(context).textTheme.headline6!.color,
                  //     letterSpacing: 0.6,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   ),
                  // ],),
                  // Divider(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Entry Fee", style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.6,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text("₹${widget.contestId}", style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.6,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],),
                  SizedBox(height: 20),
                  Text("By joining this contest,you accept Winable11 T&C's",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                    letterSpacing: 0.6,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      _con.payContestFee(widget.fee, widget.contestId);
                    },
                    child: Container(
                      height: 40,
                      width:180,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      alignment: Alignment.center,
                      child: Text("Join Contest",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        letterSpacing: 0.6,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  SizedBox(height: 15,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}







