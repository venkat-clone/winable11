// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/modules/home/drawer/more/Tarms.dart';
import 'package:newsports/modules/home/drawer/more/help.dart';
import 'package:newsports/modules/home/drawer/more/inviteCode.dart';
import 'package:newsports/modules/home/drawer/more/privicyPolices.dart';
import 'package:newsports/modules/home/drawer/more/whatsappUpdate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about_us.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('More'),
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              container(AppLocalizations.of('Community Guidelines'),
                  Icons.calendar_view_day_outlined, () {

                  }),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('Enter Contest Code'),
                Icons.code_rounded,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InviteCodePage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('WhatsApp Updates'),
                FontAwesomeIcons.whatsapp,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WhatsAppUpdatePage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('How To Play'),
                Icons.gamepad,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpPage(),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 4,
              // ),
              // container(
              //   AppLocalizations.of('Jobs'),
              //   Icons.backpack,
              //   () {},
              // ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('About Us'),
                FontAwesomeIcons.trophy,
                () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
                },
              ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('Legality'),
                Icons.calendar_view_day_outlined,
                () {

                },
              ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('Terms and\tConditions'),
                Icons.file_present,
                () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TermsAndConditions()));
                },
              ),
              SizedBox(
                height: 4,
              ),
              container(
                AppLocalizations.of('Privacy Polices'),
                Icons.file_present,
                () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolices()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget container(String txt1, IconData icon, VoidCallback onTap) {
    return Container(
      height: 50,
      color: Colors.grey.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).textTheme.headline6!.color,
                size: 20,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                txt1,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).textTheme.headline6!.color,
                      letterSpacing: 0.6,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).textTheme.headline6!.color,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
