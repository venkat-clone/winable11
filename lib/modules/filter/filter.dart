// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
              Container(
                color: Color(0xffF3F3F3),
                height: AppBar().preferredSize.height,
                child: appBar(),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Entry'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              txtContainer("₹1-₹50"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("₹51-₹100"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("₹101-₹1,000"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          txtContainer("₹1,001 & above"),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Number of Teams'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              txtContainer("2"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("3-10"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("11-100"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          txtContainer("1,000 & above"),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Prize Pool'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              txtContainer("₹1-₹10,000"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("₹10,000-₹1 Lakh"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              txtContainer("₹1 Lakh-₹10 Lakh"),
                              SizedBox(
                                width: 10,
                              ),
                              txtContainer("₹10 Lakh-₹25 Lakh"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          txtContainer("₹25 Lakh & above"),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Contest Type'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff317E2F),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of('Apply'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).appBarTheme.color,
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
          ),
        ],
      ),
    );
  }

  Widget txtContainer(String txt) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).disabledColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
        child: Text(
          txt,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black54,
                letterSpacing: 0.6,
                fontSize: 12,
              ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).textTheme.headline6!.color,
              size: 24,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            AppLocalizations.of('Filter'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
          ),
          Expanded(child: SizedBox()),
          Text(
            AppLocalizations.of('CLEAR'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
