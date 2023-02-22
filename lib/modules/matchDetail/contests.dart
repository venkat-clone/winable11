// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/matchDetailCardView.dart';
import 'package:flutter/material.dart';

class ContestsPage extends StatefulWidget {
  @override
  _ContestsPageState createState() => _ContestsPageState();
}

class _ContestsPageState extends State<ContestsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of('Mega Contest'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  AppLocalizations.of('Get ready for mega winnings!'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
                SizedBox(
                  height: 15,
                ),
                MatchDetailCardView(
                  txt1: AppLocalizations.of('₹5 Lakhs'),
                  txt2: "₹25",
                  txt3: AppLocalizations.of('18,406 sports left'),
                  txt4: AppLocalizations.of('26,595 spots'),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  AppLocalizations.of('Hot Contest'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  AppLocalizations.of('Filling Fast. Join Now!'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
                SizedBox(
                  height: 15,
                ),
                MatchDetailCardView(
                  txt1: AppLocalizations.of('₹1 Lakhs'),
                  txt2: "₹33",
                  txt3: AppLocalizations.of('3,199 sports left'),
                  txt4: AppLocalizations.of('4,029 spots'),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of('Head-to-Head'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          AppLocalizations.of('The Ultimate Face Off!'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('View All'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                MatchDetailCardView(
                  txt1: AppLocalizations.of('₹5 Lakhs'),
                  txt2: "₹25",
                  txt3: AppLocalizations.of('18,406 sports left'),
                  txt4: AppLocalizations.of('26,595 spots'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
