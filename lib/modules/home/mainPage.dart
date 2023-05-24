// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/MatchController.dart';
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
import 'package:newsports/utils/shared_preference_services.dart';
import 'package:newsports/utils/value_notifiers.dart';
import 'package:shimmer/shimmer.dart';

import '../../widget/cardView.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends StateMVC<MainPage>
    with SingleTickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  late TabController tabController;
  int _selectedIndex = 0;

  bool isCricket = true;
  bool isFootball = false;
  bool isBasketball = false;
  bool isBaseball = false;
  bool isNFL = false;
  bool isHandball = false;

  late MatchController _con;
  _MainPageState():super(MatchController()){
    _con = controller as MatchController;
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int pageNumber = 0;
  late PageController _pageController;

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  textContainer(double width) {
    return Container(
      height: 12,
      width: width,
      decoration: BoxDecoration(
          color: Theme.of(context).disabledColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  iconContainer() {
    return Container(
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).disabledColor.withOpacity(0.5),
      ),
    );
  }

  smimmersEffect(bool _isLoading) {
    return Container(
      height: MediaQuery.of(context).size.height - 204,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).disabledColor.withOpacity(0.5),
        highlightColor: Colors.white,
        enabled: _isLoading,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, __) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Expanded(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .color!
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 180,
                  child: CarouselSlider(
                    items: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 100,
                        color: Colors.white,
                      )
                    ],
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 15),
                    child: textContainer(200)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        100,
                        (index) => Row(
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .color!
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            textContainer(200),
                                            Expanded(child: SizedBox()),
                                            Icon(
                                                Icons.notifications_on_outlined)
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  textContainer(50),
                                                  Expanded(child: SizedBox()),
                                                  textContainer(50)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  textContainer(40),
                                                  Expanded(child: SizedBox()),
                                                  textContainer(100),
                                                  Expanded(child: SizedBox()),
                                                  textContainer(40),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              textContainer(100),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(child: SizedBox()),
                                              iconContainer()
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setSport() async {
    await SharedPreferenceService.setSport(isCricket?"Cricket":"FootBall");
  }

  @override
  Widget build(BuildContext context) {
    // set sport
    setSport();
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
        onTap: () {
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
                                  backgroundImage: currentUser.value.photo !="" ? NetworkImage( currentUser.value.photo ??""):null,
                                  child: currentUser.value.photo == ""
                                      ? Text(currentUser.value.getFirstLetter(),
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          color: Theme.of(context).primaryColor
                                      )): SizedBox(),
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
              isCricket ? CricketPage(controller: _con)
                      : isFootball
                          ? FootballPage(controller: _con,)
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

  Widget tabBarv(s) => TabBar(
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
          customTab(FontAwesomeIcons.basketballBall, "Cricket"),

          customTab(FontAwesomeIcons.basketballBall, "Football"),
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

  Tab customTab(IconData icon, String text) => Tab(
        icon: Icon(
          icon,
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
                isCricket == true
                    ? Theme.of(context).primaryColor
                    : (Theme.of(context).textTheme.caption!.color)!,
                isCricket == true
                    ? Theme.of(context).primaryColor
                    : (Theme.of(context).textTheme.caption!.color)!),
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
                isFootball == true
                    ? Theme.of(context).primaryColor
                    : (Theme.of(context).textTheme.caption!.color)!,
                isFootball == true
                    ? Theme.of(context).primaryColor
                    : (Theme.of(context).textTheme.caption!.color)!),
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

  Widget customColumn(
      String txt, IconData icon, Color iconColor, Color textColor) {
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
