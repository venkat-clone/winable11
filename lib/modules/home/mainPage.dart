// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/profile/notification.dart';
import 'package:flutter/material.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/modules/sports/baseball.dart';
import 'package:newsports/modules/sports/basketball.dart';
import 'package:newsports/modules/sports/cricket.dart';
import 'package:newsports/modules/sports/football.dart';
import 'package:newsports/modules/sports/handball.dart';
import 'package:newsports/modules/sports/nfl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  late TabController tabController ;
  int _selectedIndex= 0;

  bool isCricket = true;
  bool isFootball = false;
  bool isBasketball = false;
  bool isBaseball = false;
  bool isNFL = false;
  bool isHandball = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    tabController = TabController(initialIndex:0,length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int pageNumber = 0;
  late PageController _pageController;


  void closeDrawer()=>
      setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;}
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.color,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      child: InkWell(
        onTap: (){
          closeDrawer();
        },
        child: AbsorbPointer(
          absorbing: isDrawerOpen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: AppBar().preferredSize.height,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      isDrawerOpen
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 26,
                                color: Colors.white,
                              ),
                            )
                          : Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white,
                                  backgroundImage:NetworkImage(FirebaseAuth.instance.currentUser?.photoURL??""),

                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      xOffset = 230;
                                      yOffset = 150;
                                      scaleFactor = 0.6;
                                      isDrawerOpen = true;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.sort,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                      Expanded(child: SizedBox()),
                      Text(
                        "Winable 11",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 22,
                            ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: AppBar().preferredSize.height,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: tabBar(),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*0.74,
              //   child: TabBarView(
              //     controller: tabController,
              //       children: [
              //         CricketPage(),
              //         FootballPage(),
              //         // BasketballPage(),
              //         // BaseballPage(),
              //         // NFLPage(),
              //         // HandballPage(),
              //         // HandballPage(),
              //         // HandballPage(),
              //         // HandballPage(),
              //         // HandballPage(),
              //         // HandballPage(),
              //         // HandballPage()
              //       ]),
              // ),
              //
              isCricket
                  ? CricketPage()
                  : isFootball
                      ? FootballPage()
                      : isBasketball
                          ? BasketballPage()
                          : isBaseball
                              ? BaseballPage()
                              : isNFL
                                  ? NFLPage()
                                  : isHandball
                                      ? HandballPage()
                                      : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }


  Widget tabBarv(s)=>TabBar(
    indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 0.0),
        // insets: EdgeInsets.symmetric(horizontal:16.0)
    ),
    // indicator: BoxDecoration(
    //
    // ),
    indicatorWeight: 0.0,
    indicatorSize: TabBarIndicatorSize.label,
    controller: tabController,
    onTap: (index) => setState(() => _selectedIndex = index),
    isScrollable: true,
    labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 10,
    ),
    labelColor: Theme.of(context).primaryColor,


    // padding: EdgeInsets.only(bottom: 10),
    tabs: [
      customTab(FontAwesomeIcons.basketballBall,"Cricket"),

      customTab(FontAwesomeIcons.basketballBall,"Football"),
      // customTab("assets/images/3.png","BasketBall"),
      // customTab("assets/images/3.png","BaseBall"),
      // customTab("assets/images/9.png","NFL"),
      // customTab("assets/images/2.png","HandBall"),
      // customTab("assets/images/8.png","Tennis"),
      // customTab("assets/images/5.png","Boxing"),
      // customTab("assets/images/6.png","VolleyBall"),
      // customTab("assets/images/7.png","Badminton"),
      // customTab("assets/images/10.png","Hockey"),
      // customTab("assets/images/11.png","Kabaddi"),

    ],
  );

  Tab customTab(IconData icon,String text)=>Tab(
    icon: Icon(icon,
      // color: iconColor,
      size: 18,
    ),
  );


  Widget tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isCricket = true;
                isFootball = false;
                isBasketball = false;
                isBaseball = false;
                isNFL = false;
                isHandball = false;
              });
            },
            child: customColumn(
                AppLocalizations.of('Cricket'),
                FontAwesomeIcons.baseballBall,
                isCricket == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
                isCricket == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCricket = false;
                isFootball = true;
                isBasketball = false;
                isBaseball = false;
                isNFL = false;
                isHandball = false;
              });
            },
            child: customColumn(
                AppLocalizations.of('Football'),
                FontAwesomeIcons.basketballBall,
                isFootball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
                isFootball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       isCricket = false;
          //       isFootball = false;
          //       isBasketball = true;
          //       isBaseball = false;
          //       isNFL = false;
          //       isHandball = false;
          //     });
          //   },
          //   child: customColumn(
          //       AppLocalizations.of('Basketball'),
          //       FontAwesomeIcons.basketballBall,
          //       isBasketball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
          //       isBasketball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          // ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       isCricket = false;
          //       isFootball = false;
          //       isBasketball = false;
          //       isBaseball = true;
          //       isNFL = false;
          //       isHandball = false;
          //     });
          //   },
          //   child: customColumn(
          //       AppLocalizations.of('Baseball'),
          //       FontAwesomeIcons.baseballBall,
          //       isBaseball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
          //       isBaseball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          // ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       isCricket = false;
          //       isFootball = false;
          //       isBasketball = false;
          //       isBaseball = false;
          //       isNFL = true;
          //       isHandball = false;
          //     });
          //   },
          //   child: customColumn(
          //       AppLocalizations.of('NFL'),
          //       FontAwesomeIcons.footballBall,
          //       isNFL == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
          //       isNFL == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          // ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       isCricket = false;
          //       isFootball = false;
          //       isBasketball = false;
          //       isBaseball = false;
          //       isNFL = false;
          //       isHandball = true;
          //     });
          //   },
          //   child: customColumn(
          //       AppLocalizations.of('HandBall'),
          //       FontAwesomeIcons.basketballBall,
          //       isHandball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!,
          //       isHandball == true ? Theme.of(context).primaryColor : (Theme.of(context).textTheme.caption!.color)!),
          // ),
        ],
      ),
    );
  }

  Widget customColumn(String txt, IconData icon, Color iconColor, Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          txt,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: textColor,
                letterSpacing: 0.6,
                fontSize: 10,
              ),
        ),
      ],
    );
  }
}
