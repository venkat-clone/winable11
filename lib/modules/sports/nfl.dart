// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../constance/constance.dart';

class NFLPage extends StatefulWidget {
  @override
  _NFLPageState createState() => _NFLPageState();
}

class _NFLPageState extends State<NFLPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                child: Text(
                  AppLocalizations.of('Upcoming Matches'),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        fontSize: 18,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
