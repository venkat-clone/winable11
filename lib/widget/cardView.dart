// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/models/MatchModel.dart';
import 'package:newsports/modules/matchDetail/matchDetailPage.dart';
import 'package:flutter/material.dart';

import '../models/Team.dart';

class CardView extends StatefulWidget {
  final MatchModel match;

  const CardView({
    Key? key,
    required this.match,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchDetailPage(
              match: widget.match,
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
                      SizedBox(height: 2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                match.title,
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
                                  Text(
                                    match.team1.teamName,
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    match.team2.teamName,
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.caption!.color,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
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
                                  Text(
                                    match.matchDateTime,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                      // Container(
                      //   height: 35,
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).disabledColor.withOpacity(0.2),
                      //     borderRadius: BorderRadius.only(
                      //       bottomLeft: Radius.circular(10),
                      //       bottomRight: Radius.circular(10),
                      //     ),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //       left: 10,
                      //       right: 10,
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           '1 Team',
                      //           style: Theme.of(context).textTheme.caption!.copyWith(
                      //                 color: Theme.of(context).primaryColor,
                      //                 fontWeight: FontWeight.bold,
                      //                 letterSpacing: 0.6,
                      //                 fontSize: 14,
                      //               ),
                      //         ),
                      //         SizedBox(
                      //           width: 5,
                      //         ),
                      //         Container(
                      //           height: 25,
                      //           width: 60,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(4),
                      //             border: Border.all(
                      //               color: Theme.of(context).primaryColor,
                      //             ),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Mega",
                      //               style: Theme.of(context).textTheme.caption!.copyWith(
                      //                     color: Theme.of(context).primaryColor,
                      //                     fontWeight: FontWeight.bold,
                      //                     letterSpacing: 0.6,
                      //                     fontSize: 12,
                      //                   ),
                      //             ),
                      //           ),
                      //         ),
                      //         Expanded(child: SizedBox()),
                      //         Icon(
                      //           Icons.outbox,
                      //           color: Theme.of(context).primaryColor,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
  final String? txt1;
  final String? txt2;
  final String? txt3;
  final String? txt4;
  final String? txt5;
  final String? txt6;
  final String? txt7;
  final Image? image1;
  final Image? image2;
  final MatchModel match;


  const CompleteCardView({
    Key? key,
    required this.match,
    this.txt1,
    this.txt2,
    this.txt3,
    this.txt4,
    this.txt6,
    this.txt7,
    this.image1,
    this.image2,
    this.txt5,
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
            builder: (context) => MatchDetailPage(
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
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.txt1!,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).textTheme.caption!.color,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                ),
                          ),
                          Expanded(child: SizedBox()),
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
                                Text(
                                  widget.txt2!,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  widget.txt3!,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
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
                                  child: widget.image1,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.txt4!,
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                        color: Theme.of(context).textTheme.headline6!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  widget.txt5!,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).textTheme.caption!.color,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  widget.txt6!,
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
                                  child: widget.image2,
                                ),
                              ],
                            ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.txt7!,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of('Mega'),
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
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
        ],
      ),
    );
  }
}
