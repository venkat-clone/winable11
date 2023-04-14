// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/main.dart';
import 'package:newsports/modules/home/drawer/inviteFriend.dart/inviteFriend.dart';
import 'package:newsports/modules/home/drawer/more/more.dart';
import 'package:newsports/modules/home/drawer/mybalance/myBalance.dart';
import 'package:newsports/modules/home/drawer/offer.dart';
import 'package:newsports/modules/home/drawer/profile/pointSystem/pointSystem.dart';
import 'package:newsports/modules/home/drawer/profile/tournamentLeaderboard.dart';
import 'package:newsports/modules/home/drawer/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsports/constance/constance.dart' as constance;

import '../../../utils/shared_preference_services.dart';
import '../../../utils/value_notifiers.dart';
import '../../kyc/kyc_page.dart';
import 'mybalance/upi_Interface.dart';
import 'profile/profile.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).appBarTheme.color,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Theme.of(context).primaryColor,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: Container(
                height: 80,
                color: Theme.of(context).appBarTheme.color!.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            backgroundImage: currentUser.value.photo !="" ?NetworkImage(
                                currentUser.value.photo ?? ""):null,
                            child: currentUser.value.photo == ""
                                    ? Text(currentUser.value.getFirstLetter(),
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).primaryColor
                            ),)
                                    : SizedBox(),
                          ),
                          InkWell(
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor:
                                  Theme.of(context).appBarTheme.color,
                              child: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                size: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentUser.value.name,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .color,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            AppLocalizations.of('Level') +
                                " ${currentUser.value.level}",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
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
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).appBarTheme.color!.withOpacity(0.7),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    customRow(
                      AppLocalizations.of('My Balance'),
                      Icons.wallet_giftcard,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBalancePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('KYC'),
                      Icons.account_balance,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KYCForm(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('Invite Friends'),
                      Icons.inbox,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InviteFriendPage(),
                          ),
                        );
                      },
                    ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // customRow(
                    //   AppLocalizations.of('Find People'),
                    //   Icons.search,
                    //   () {},
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('My Coupons'),
                      Icons.wallet_giftcard,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('Winable Points System'),
                      Icons.gamepad,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PointSystemPage(),
                          ),
                        );
                      },
                    ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // customRow(
                    //   AppLocalizations.of('Weekly Leaderboard'),
                    //   Icons.wallet_giftcard,
                    //   () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) =>
                    //             TournamentLeaderBoardPage(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('My Info & Settings'),
                      Icons.wallet_giftcard,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('More'),
                      Icons.wallet_giftcard,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MorePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('Theme'),
                      FontAwesomeIcons.moon,
                      () {
                        openShowPopup(context);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('Language'),
                      Icons.language,
                      () {
                        openShowPopupLanguage();
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    customRow(
                      AppLocalizations.of('Logout'),
                      Icons.logout_rounded,
                      () {
                        logout();
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customRow(
                  AppLocalizations.of('Helpdesk'),
                  Icons.help_rounded,
                      () {},
                ),
                Expanded(child: SizedBox()),
                customRow(
                  AppLocalizations.of('Chat With us'),
                  Icons.wallet_giftcard,
                      () {},
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget customRow(String txt, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).textTheme.headline6!.color),
            SizedBox(
              width: 20,
            ),
            Text(
              txt,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).textTheme.headline6!.color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  openShowPopupLanguage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                AppLocalizations.of(
                    AppLocalizations.of('Select  your Language')),
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline6!.color,
                      fontSize: 18,
                    ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    selectLanguage('en');
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of('English'),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    selectLanguage('fr');
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of('French'),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    selectLanguage('ar');
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of('Arabic'),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    selectLanguage('ja');
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of('Japanese'),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  selectLanguage(String languageCode) {
    constance.locale = languageCode;
    MyApp.setCustomeLanguage(context, languageCode);
  }

  int light = 1;
  int dark = 2;
  bool selectFirstColor = false;
  bool selectSecondColor = false;
  bool selectThirdColor = false;
  bool selectFourthColor = false;
  bool selectFifthColor = false;
  bool selectSixthColor = false;

  logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey.shade600,
                  )),
          actions: <Widget>[
            TextButton(
              child: Text('Logout', style: TextStyle(color: Colors.blue)),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                SharedPreferenceService.initSharedPreferences(login: false);
                Navigator.of(context).popUntil(
                  (route) => !route.isFirst,
                );
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  changeColor(BuildContext context, int color) {
    if (color == light) {
      MyApp.setCustomeTheme(context, 6);
    } else {
      MyApp.setCustomeTheme(context, 7);
    }
  }

  openShowPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Select theme mode',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline6!.color,
                      fontSize: 18,
                    ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        changeColor(context, light);
                      },
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor:
                            Theme.of(context).textTheme.headline6!.color,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32,
                          child: Text(
                            AppLocalizations.of('Light'),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        changeColor(context, dark);
                      },
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor:
                            Theme.of(context).textTheme.headline6!.color,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 32,
                          child: Text(
                            AppLocalizations.of('Dark'),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectfirstColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFFEB1165),
                        child: !selectFirstColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectsecondColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF32a852),
                        child: selectSecondColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectthirdColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFFe6230e),
                        child: selectThirdColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectfourthColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF760ee6),
                        child: selectFourthColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectfifthColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF008080),
                        child: selectFifthColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectsixthColor(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF4FBE9F),
                        child: selectSixthColor
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Theme.of(context).appBarTheme.color,
                              )
                            : SizedBox(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  selectfirstColor(BuildContext context) {
    if (selectFirstColor) {
      selectFirstColor = false;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;

      MyApp.setCustomeTheme(context, 0);
    }
  }

  selectsecondColor(BuildContext context) {
    if (!selectSecondColor) {
      selectFirstColor = true;
      selectSecondColor = true;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;

      MyApp.setCustomeTheme(context, 1);
    }
  }

  selectthirdColor(BuildContext context) {
    if (!selectThirdColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = true;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 2);
  }

  selectfourthColor(BuildContext context) {
    if (!selectFourthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = true;
      selectFifthColor = false;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 3);
  }

  selectfifthColor(BuildContext context) {
    if (!selectFifthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = true;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 4);
  }

  selectsixthColor(BuildContext context) {
    if (!selectSixthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = true;
    }
    MyApp.setCustomeTheme(context, 5);
  }
}
