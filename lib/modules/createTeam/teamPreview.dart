// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

class TeamPreViewPage extends StatefulWidget {
  @override
  _TeamPreViewPageState createState() => _TeamPreViewPageState();
}

class _TeamPreViewPageState extends State<TeamPreViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ConstanceData.cricketGround),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).appBarTheme.color,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of('Wicket Keepers'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      playerDetail(
                        AppLocalizations.of('J.Buttler'),
                        AppLocalizations.of('9.5 Cr'),
                        Image.asset(
                          ConstanceData.buttler,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('S.Samson'),
                        AppLocalizations.of('9.5 Cr'),
                        Image.asset(
                          ConstanceData.samson,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('A. Rawats'),
                        AppLocalizations.of('8 Cr'),
                        Image.asset(
                          ConstanceData.rawat,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      AppLocalizations.of('BatsMen'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      playerDetail(
                        AppLocalizations.of('S.Smith'),
                        AppLocalizations.of('9 Cr'),
                        Image.asset(
                          ConstanceData.smith,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('A.Joshi'),
                        "7.5 Cr",
                        Image.asset(
                          ConstanceData.joshi,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('Y.Jaiswal'),
                        AppLocalizations.of('8 Cr'),
                        Image.asset(
                          ConstanceData.jaiswal,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      AppLocalizations.of('All-Rounders'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      playerDetail(
                        AppLocalizations.of('C.Morris'),
                        AppLocalizations.of('9 Cr'),
                        Image.asset(
                          ConstanceData.morris,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('R.Rewatia'),
                        AppLocalizations.of('9 Cr'),
                        Image.asset(
                          ConstanceData.rewatia,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      AppLocalizations.of('Bowlers'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                            letterSpacing: 0.6,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      playerDetail(
                        AppLocalizations.of('D.Steyn'),
                        AppLocalizations.of('8.5 Cr'),
                        Image.asset(
                          ConstanceData.steyn,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('Y.Chahal'),
                        AppLocalizations.of('9 Cr'),
                        Image.asset(
                          ConstanceData.chahal,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                      playerDetail(
                        AppLocalizations.of('M.siraj'),
                        AppLocalizations.of('8 Cr'),
                        Image.asset(
                          ConstanceData.siraj,
                          fit: BoxFit.cover,
                        ),
                        (Theme.of(context).appBarTheme.color)!,
                        (Theme.of(context).textTheme.headline6!.color)!,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget playerDetail(String txt1, String txt2, Image image1, Color color, Color txtColor) {
    return Stack(
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
                color: color,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                  child: Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: txtColor,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                  ),
                ),
              ),
              Text(
                txt2,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).appBarTheme.color,
                      letterSpacing: 0.6,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
