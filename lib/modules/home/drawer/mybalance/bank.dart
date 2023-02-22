// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BankPage extends StatefulWidget {
  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                              color: Colors.black87,
                              size: 14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of('Verify Bank Account'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black87,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  AppLocalizations.of(
                                      '(Verify your account to withdraw winnings)'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black45,
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(
                                    'To transfer winnings to your bankDetails\naccount, please complete the steps\nmentioned below:'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 42),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.black54,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                AppLocalizations.of(
                                    'Verify your mobile number'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 42),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.black54,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                AppLocalizations.of('Verify your email id'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 42),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.black54,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                AppLocalizations.of('Verify your PAN card'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
