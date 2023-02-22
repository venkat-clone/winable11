// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

class CricketPointPage extends StatefulWidget {
  @override
  _CricketPointPageState createState() => _CricketPointPageState();
}

class _CricketPointPageState extends State<CricketPointPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Batting Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Run'),
                  "+1",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Boundary Bonus'),
                  "+1",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Six Bonus'),
                  "+2",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Half-century Bonus'),
                  "+8",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Century Bomus'),
                  "+16",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Dismissal for a duck'),
                  "-2",
                  (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Bowling Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Wicket (Excluding Run Out)'),
                  "+25",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('4 wicket haul Bonus'),
                  "+8",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('5 wicket haul  Bonus'),
                  "+16",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Maiden over'),
                  "+8",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Fielding Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Catch'),
                  "+8",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Stumping/Run-out'),
                  "+12",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Run Out (Thrower)'),
                  "+6",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Run Out (Catcher)'),
                  "+8",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Other Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Captain'),
                  "2x",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Vice-Captain'),
                  "1.5x",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('In Starting'),
                  "+4",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Economy Rate Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                AppLocalizations.of('Min 2 Overs To Be Bowled'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      letterSpacing: 0.6,
                      fontSize: 12,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Below 4 runs per over'),
                  "+6",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Between 4-4.99 runs per over'),
                  "+4",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Between 5-6 runs per over'),
                  "+2",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Between 9-10 runs per over'),
                  "-2",
                  (Colors.green[300])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Between 10.01-11 runs per over'),
                  "-4",
                  (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Above 11 runs per over'),
                  "-6",
                  (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Card(
            child: ExpansionTile(
              title: Text(
                AppLocalizations.of('Strike Rate (Except Bowler) Points'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                AppLocalizations.of('Min 10 Balls To Be Played'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      letterSpacing: 0.6,
                      fontSize: 12,
                    ),
              ),
              children: [
                row(
                  AppLocalizations.of('Between 60-70 runs per 100 balls'),
                  "-2",
                  (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Between 50-59.99 runs per 100 balls'),
                  "-4",
                   (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                ),
                SizedBox(
                  height: 1,
                ),
                row(
                  AppLocalizations.of('Below 50 runs per 100 balls'),
                  "-6",
                  (Colors.red[100])!,
                  Theme.of(context).appBarTheme.color!.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          color: Theme.of(context).appBarTheme.color,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of('Other Important Points'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).textTheme.headline6!.color,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget row(String txt1, String txt2, Color color, Color containerColor) {
    return Container(
      color: containerColor,
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Row(
          children: [
            Text(
              txt1,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.headline6!.color,
                    letterSpacing: 0.6,
                    fontSize: 14,
                  ),
            ),
            Expanded(child: SizedBox()),
            Container(
              height: 30,
              width: 30,
              color: color,
              child: Center(
                child: Text(
                  txt2,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
