// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

class MyTeamPage extends StatefulWidget {
  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .color!
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(
                                              'PARTH37OQR (T1)'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.white,
                                                letterSpacing: 0.6,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.copy,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "RR",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                          ),
                                          Text(
                                            "7",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "BLR",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                          ),
                                          Text(
                                            "4",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      playerDetail(
                                        AppLocalizations.of('J.Buttler'),
                                        "C",
                                        Image.asset(ConstanceData.buttler),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      playerDetail(
                                        AppLocalizations.of('V.Kohali'),
                                        "VC",
                                        Image.asset(ConstanceData.cricketerPic),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .appBarTheme
                                  .color!
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of('WK'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "3",
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
                                  Text(
                                    AppLocalizations.of('BAT'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "3",
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
                                  Text(
                                    AppLocalizations.of('AR'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "3",
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
                                  Text(
                                    AppLocalizations.of('BOWL'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.black45,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "3",
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget playerDetail(String txt1, String txt2, Image image1) {
    return Stack(
      //alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(height: 55, width: 55, child: image1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 6, right: 6, top: 2, bottom: 2),
                  child: Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border:
                Border.all(color: (Theme.of(context).textTheme.headline6!.color!)),
          ),
          child: Center(
            child: Text(
              txt2,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.black,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
