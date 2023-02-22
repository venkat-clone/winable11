// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/mybalance/bank.dart';
import 'package:newsports/modules/home/drawer/mybalance/mobile.dart';
import 'package:newsports/modules/home/drawer/mybalance/pan.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  bool isMobile = true;
  bool isPan = false;
  bool isBank = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Verify Your Account'),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Theme.of(context).appBarTheme.color,
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
            color: Theme.of(context).appBarTheme.color,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            color: Theme.of(context).appBarTheme.color,
            child: tabBar(),
          ),
          isMobile == true
              ? MobilePage()
              : isPan == true
                  ? PanPage()
                  : isBank == true
                      ? BankPage()
                      : SizedBox(),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isMobile = true;
                isBank = false;
                isPan = false;
              });
            },
            child: Text(
              AppLocalizations.of('Mobile & Email'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isMobile == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              setState(() {
                isMobile = false;
                isBank = false;
                isPan = true;
              });
            },
            child: Text(
              AppLocalizations.of('PAN'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isPan == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              setState(() {
                isMobile = false;
                isBank = true;
                isPan = false;
              });
            },
            child: Text(
              AppLocalizations.of('Bank'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isBank == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
