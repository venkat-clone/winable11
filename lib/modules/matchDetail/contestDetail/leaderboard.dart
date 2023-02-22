// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(
                      'Be the first in  your network to join this contest.'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of('All Teams (22,14,037)'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 6,
              ),
              row(
                AppLocalizations.of('Vansh098xy'),
                AssetImage(ConstanceData.palyerProfilePic),
              ),
              SizedBox(
                height: 6,
              ),
              Divider(),
              SizedBox(
                height: 6,
              ),
              row(
                AppLocalizations.of('Vansh098xy'),
                AssetImage(ConstanceData.palyerProfilePic),
              ),
              SizedBox(
                height: 6,
              ),
              Divider(),
              SizedBox(
                height: 6,
              ),
              row(
                AppLocalizations.of('Vansh098xy'),
                AssetImage(ConstanceData.palyerProfilePic),
              ),
              SizedBox(
                height: 6,
              ),
              Divider(),
              row(
                AppLocalizations.of('Vansh098xy'),
                AssetImage(ConstanceData.palyerProfilePic),
              ),
              SizedBox(
                height: 6,
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget row(String txt1, AssetImage image) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: image,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            txt1,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black87,
                  letterSpacing: 0.6,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
