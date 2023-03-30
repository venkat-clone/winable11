// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:newsports/controllers/MatchController.dart';

import '../../../widget/cardView.dart';

class UpComingPage extends StatefulWidget {
  MatchController con;
  UpComingPage({required this.con});
  @override
  _UpComingPageState createState() => _UpComingPageState(con);
}

class _UpComingPageState extends StateMVC<UpComingPage> {

  late MatchController _con;
  final scrollController = ScrollController();

  _UpComingPageState(MatchController con) :super(con){
    _con = controller as MatchController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync() async{
    await _con.initSport();
    _con.getMyUpcomingMatches(context);
    return super.initAsync();
  }


  @override
  Widget build(BuildContext context) {
    if(_con.myUpComingMatchList.loading){
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_con.myUpComingMatchList.error!=null){
      return Expanded(
        child: Center(
          child: Text(_con.myUpComingMatchList.error!),
        ),
      );
    }

    if(_con.myUpComingMatchList.value!.isEmpty){
      return Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of("You haven't joined any upcoming contests"),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  letterSpacing: 0.6,
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of(
                'Join contests for any of the upcoming matches'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  letterSpacing: 0.6,
                  fontSize: 14,
                ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                  color: Color(0xff317E2F),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of('View Upcoming Matches'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }


    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: _con.myUpComingMatchList.value!.length,
          itemBuilder: (c, index) {
            final match = _con.myUpComingMatchList.value![index];
            return CardView(
              match: match,
            );
          },
          separatorBuilder:
              (BuildContext context, int index) => SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}
