// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constance/constance.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Feed'),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).disabledColor.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              FontAwesomeIcons.trophy,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of('Fantancy'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 12,
                                  ),
                                ],
                              ),
                              Text(
                                AppLocalizations.of('34 min. ago'),
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
                            Icons.more_vert,
                            color: Theme.of(context).textTheme.headline6!.color,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of(
                            'K.Rabada-Too good to not be in your Fantancy'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of('#Fantancy #KxIpvDc'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        ConstanceData.slider2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.smile,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of('React'),
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
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.share,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of('Share'),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color(0xffEFEFF4),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 14, bottom: 14),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of('Profiles To Follow'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black87,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  AppLocalizations.of('View All'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black87,
                                        letterSpacing: 0.6,
                                        fontSize: 10,
                                      ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black87,
                                  size: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                  card(
                                    AppLocalizations.of('Fantancy'),
                                    AppLocalizations.of('Official'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Theme.of(context).appBarTheme.color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              FontAwesomeIcons.trophy,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of('Fantancy'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 12,
                                  ),
                                ],
                              ),
                              Text(
                                AppLocalizations.of('34 min. ago'),
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
                                    ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.more_vert,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of(
                            'He has been a part of the Fantancy Team for the last 3\noccasions'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of(
                            'Will M. Shami feature in your Fantancy tonight?\n#FantacyIPL #FantacyPics #KXIPvDC'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        ConstanceData.slider2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.smile,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of('React'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.share,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of('Share'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 50),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.smile,
                              size: 16,
                            ),
                            Icon(
                              FontAwesomeIcons.smile,
                              size: 16,
                            ),
                            Icon(
                              FontAwesomeIcons.smile,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of('474 people'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Theme.of(context).appBarTheme.color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              FontAwesomeIcons.trophy,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of('Fantancy'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 12,
                                  ),
                                ],
                              ),
                              Text(
                                AppLocalizations.of('34 min. ago'),
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
                            Icons.more_vert,
                            color: Theme.of(context).textTheme.headline6!.color,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of(
                            'Q. Which is your favourite IPL team this season?'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        AppLocalizations.of('#FantancyIPL'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget card(
    String txt1,
    String txt2,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Container(
          height: 60,
          width: 130,
          color: Theme.of(context).appBarTheme.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  FontAwesomeIcons.trophy,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      txt1,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                    size: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                txt2,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      letterSpacing: 0.6,
                      fontSize: 12,
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xff317E2F),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of('FOLLOW'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
