import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';

class CompletedPage extends StatefulWidget {
  @override
  _CompletedPageState createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Rajsthan Royals'),
                  txt3: AppLocalizations.of('Bengaluru'),
                  txt4: "RR",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "BLR",
                  txt7: AppLocalizations.of('1 Team'),
                  image1: Image.asset(
                    ConstanceData.rajsthanRoyal,
                  ),
                  image2: Image.asset(
                    ConstanceData.banglore,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Mumbai Indians'),
                  txt3: AppLocalizations.of('Kolkata'),
                  txt4: "MI",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "KOL",
                  txt7: AppLocalizations.of('1 Team'),
                  image1: Image.asset(
                    ConstanceData.mumbaiIndians,
                  ),
                  image2: Image.asset(
                    ConstanceData.kolkata,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Channai'),
                  txt3: AppLocalizations.of('Panjab'),
                  txt4: "CN",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "PJ",
                  txt7: AppLocalizations.of('1 Team'),
                  image1: Image.asset(
                    ConstanceData.channai,
                  ),
                  image2: Image.asset(
                    ConstanceData.panjab,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Rajsthan Royals'),
                  txt3: AppLocalizations.of('Bengaluru'),
                  txt4: "RR",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "BLR",
                  txt7: "1 Team",
                  image1: Image.asset(
                    ConstanceData.rajsthanRoyal,
                  ),
                  image2: Image.asset(
                    ConstanceData.banglore,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Rajsthan Royals'),
                  txt3: AppLocalizations.of('Bengaluru'),
                  txt4: "RR",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "BLR",
                  txt7: AppLocalizations.of('1 Team'),
                  image1: Image.asset(
                    ConstanceData.rajsthanRoyal,
                  ),
                  image2: Image.asset(
                    ConstanceData.banglore,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CompleteCardView(
                  txt1: AppLocalizations.of('Fantancy Sports'),
                  txt2: AppLocalizations.of('Rajsthan Royals'),
                  txt3: AppLocalizations.of('Bengaluru'),
                  txt4: "RR",
                  txt5: AppLocalizations.of('Completed'),
                  txt6: "BLR",
                  txt7: AppLocalizations.of('1 Team'),
                  image1: Image.asset(
                    ConstanceData.rajsthanRoyal,
                  ),
                  image2: Image.asset(
                    ConstanceData.banglore,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
