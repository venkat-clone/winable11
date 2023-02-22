// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Groups'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: 250,
            child: Image.asset(
              ConstanceData.group,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of('Create Group'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              AppLocalizations.of(
                  'Your friends are waiting.\nStart a conversation and kickoff the competition!'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.bodyText2!.color,
                    letterSpacing: 0.6,
                    fontSize: 14,
                    height: 1.4,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.group_add,
          color: Theme.of(context).textTheme.headline6!.color,
          size: 28,
        ),
      ),
    );
  }
}
