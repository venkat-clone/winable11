// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/mybalance/accountInfo.dart';
import 'package:newsports/modules/home/drawer/mybalance/addCash.dart';
import 'package:newsports/modules/home/drawer/mybalance/transaction.dart';
import 'package:flutter/material.dart';

class MyBalancePage extends StatefulWidget {
  @override
  _MyBalancePageState createState() => _MyBalancePageState();
}

class _MyBalancePageState extends State<MyBalancePage> {
  int totalBalance = 0;

  getCash(authID) {
    totalBalance = 0;
    try {
      FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .collection("addedCash")
          .get()
          .then((event) {
        for (var i = 0; i < event.docs.length; i++) {
          setState(() {
            totalBalance += int.parse(event.docs[i]['amount']);
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCash(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('My Balance'),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
                letterSpacing: 0.6,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getCash(FirebaseAuth.instance.currentUser!.uid);
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              AppLocalizations.of('Total Balance'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color,
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "₹ ${totalBalance.toString()}",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xff317E2F),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => AddCash()));
                                  },
                                  child: Text(
                                    AppLocalizations.of('Add Cash'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Colors.white,
                                          letterSpacing: 0.6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of('Amount Added'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "₹0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.blue,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of('Winnings'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "₹31",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.blue,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of('Cash Bonus'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "₹0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.blue,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  container(AppLocalizations.of('My Recent Transactions'), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionPage(),
                      ),
                    );
                  }),
                  container(
                    AppLocalizations.of('Manage Payments'),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountInfoPage(),
                        ),
                      );
                    },
                  ),
                  container(
                    AppLocalizations.of('Refer and Earn'),
                    () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget container(String txt1, VoidCallback onTap) {
    return Card(
      child: Container(
        height: 50,
        color: Theme.of(context).appBarTheme.color!.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: InkWell(
            onTap: () {
              onTap();
            },
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
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
