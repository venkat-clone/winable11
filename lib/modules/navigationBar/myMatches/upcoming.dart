// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

class UpComingPage extends StatefulWidget {
  @override
  _UpComingPageState createState() => _UpComingPageState();
}

class _UpComingPageState extends State<UpComingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          AppLocalizations.of("You haven't joined any upcoming contests"),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Theme.of(context).textTheme.bodyText2!.color,
                letterSpacing: 0.6,
                fontSize: 16,
              ),
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          AppLocalizations.of('Join contests for any of the upcoming matches'),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Theme.of(context).textTheme.bodyText2!.color,
                letterSpacing: 0.6,
                fontSize: 14,
              ),
        ),
        SizedBox(
          height: 40,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Container(
            height: 40,
            width: 220,
            decoration: BoxDecoration(
              color: Color(0xff317E2F),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of('View Upcoming Matches'),
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
    );
  }
}
