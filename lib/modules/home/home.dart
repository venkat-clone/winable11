// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/drawer.dart';
import 'package:newsports/modules/home/drawer/profile/profile.dart';
import 'package:newsports/modules/home/mainPage.dart';
import 'package:newsports/modules/navigationBar/feed/feed.dart';
import 'package:newsports/modules/navigationBar/group.dart';
import 'package:newsports/modules/navigationBar/myMatches/myMatches.dart';
import 'package:newsports/modules/navigationBar/winner/winner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dev/api_routes.dart';
import '../navigationBar/winner/winner_oldui.dart';

class HomeScreen extends StatelessWidget {
  final IsSelect objIsSelect = new IsSelect();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomAppBarWidget(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    size: 22,
                    color: objIsSelect.home ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  ),
                  text: AppLocalizations.of('Home'),
                  ontap: () {},
                  color: objIsSelect.home ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                ),
                BottomAppBarWidget(
                  icon: Icon(
                    FontAwesomeIcons.basketballBall,
                    size: 22,
                    color: objIsSelect.match ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  ),
                  text: AppLocalizations.of('Matches'),
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyMatchesPage(),
                      ),
                    );
                  },
                  color: objIsSelect.match ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                ),
                BottomAppBarWidget(
                  icon: Icon(
                    FontAwesomeIcons.award,
                    size: 22,
                    color: objIsSelect.win ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  ),
                  text: AppLocalizations.of('Winners'),
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WinnerPage(),
                    ));

                  },
                  color: objIsSelect.win ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                ),
                BottomAppBarWidget(
                  icon: Icon(
                    FontAwesomeIcons.userLarge,
                    size: 22,
                    color: objIsSelect.group ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  ),
                  text: AppLocalizations.of('Profile'),
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  color: objIsSelect.group ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                ),
                BottomAppBarWidget(
                  icon: Icon(
                    FontAwesomeIcons.images,
                    size: 22,
                    color: objIsSelect.feed ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  ),
                  text: AppLocalizations.of('Feed'),
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedPage(),
                      ),
                    );
                  },
                  color: objIsSelect.feed ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: !kDebugMode?null:InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (c)=>ApiRoutes()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(12),
          child: Text('Network debug',style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}

class IsSelect {
  bool home;
  bool match;
  bool win;
  bool group;
  bool feed;

  IsSelect({
    this.home = true,
    this.match = false,
    this.win = false,
    this.group = false,
    this.feed = false,
  });
}

class BottomAppBarWidget extends StatelessWidget {
  final Icon? icon;
  final String? text;
  final VoidCallback? ontap;
  final Color? color;

  const BottomAppBarWidget({Key? key, this.icon, this.text, this.ontap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon!,
          SizedBox(
            height: 5,
          ),
          Text(
            text!,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
