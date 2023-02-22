// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of('RANK'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('PRIZE'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 1", AppLocalizations.of('₹1 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 2", AppLocalizations.of('₹10 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 3", AppLocalizations.of('₹5 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 4", AppLocalizations.of('₹4 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 5", AppLocalizations.of('₹3 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 6", AppLocalizations.of('₹2 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              row("# 7-8", AppLocalizations.of('₹9 Crore')),
              SizedBox(
                height: 10,
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget row(String txt1, String txt2) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Row(
        children: [
          Text(
            txt1,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(child: SizedBox()),
          Text(
            txt2,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
