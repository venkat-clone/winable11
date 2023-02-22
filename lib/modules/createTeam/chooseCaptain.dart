// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

class ChooseCaptainPage extends StatefulWidget {
  @override
  _ChooseCaptainPageState createState() => _ChooseCaptainPageState();
}

class _ChooseCaptainPageState extends State<ChooseCaptainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: AppBar().preferredSize.height,
                color: Theme.of(context).primaryColor,
                child: appBar(),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).disabledColor.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of('Choose your Captain and Vice Captain'),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of('C gets 2x points, VC gets 1.5x points'),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of('Type'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        AppLocalizations.of('Points'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        AppLocalizations.of('% C By'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        AppLocalizations.of('% VC By'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        cardView(
                          AppLocalizations.of('RR'),
                          "WX",
                          AppLocalizations.of('archer'),
                          "391",
                          "C",
                          "5.8%",
                          "VC",
                          "5.97%",
                          AssetImage(ConstanceData.archer),
                        ),
                        cardView(
                          "RR",
                          "WX",
                          AppLocalizations.of('chahal'),
                          "268",
                          "c",
                          "5.8%",
                          "VC",
                          "11.16%",
                          AssetImage(ConstanceData.chahal),
                        ),
                        cardView(
                          "RR",
                          "WX",
                          AppLocalizations.of('finch'),
                          "0",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.finch),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('jaiswal'),
                          "246",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.jaiswal),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('joshi'),
                          "0",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.joshi),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('morris'),
                          "0",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.morris),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('siraj'),
                          "246",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.siraj),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('smith'),
                          "0",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.smith),
                        ),
                        cardView(
                          "RR",
                          "BAT",
                          AppLocalizations.of('steyn'),
                          "0",
                          "C",
                          "0.4%",
                          "1.5x",
                          "5.97%",
                          AssetImage(ConstanceData.steyn),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 70,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Team Preview'),
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
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Color(0xff317E2F),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Save Team'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).appBarTheme.color,
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
            ],
          )
        ],
      ),
    );
  }

  Widget cardView(
    String txt1,
    String txt2,
    String txt3,
    String txt4,
    String txt5,
    String txt6,
    String txt7,
    String txt8,
    AssetImage image1,
  ) {
    return Card(
      child: Container(
        color: Theme.of(context).disabledColor.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: image1,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            bottomLeft: Radius.circular(2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            txt1,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 8,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffD0C1AB),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            txt2,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Theme.of(context).textTheme.headline6!.color,
                                  letterSpacing: 0.6,
                                  fontSize: 8,
                                ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt3,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txt4,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (Theme.of(context).textTheme.bodyText2!.color)!,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        txt5,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txt6,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (Theme.of(context).textTheme.bodyText2!.color)!,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        txt7,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txt8,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
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
          Expanded(child: SizedBox()),
          Text(
            "5h 47m left",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.6,
                  fontSize: 22,
                ),
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.help,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}
