// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

class MyContestsPage extends StatefulWidget {
  @override
  _MyContestsPageState createState() => _MyContestsPageState();
}

class _MyContestsPageState extends State<MyContestsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of("You haven't joined a contest yet!"),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black54,
                  letterSpacing: 0.6,
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of('What are you waiting for?'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black54,
                  letterSpacing: 0.6,
                  fontSize: 14,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
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
                  AppLocalizations.of('Join A Contest'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
