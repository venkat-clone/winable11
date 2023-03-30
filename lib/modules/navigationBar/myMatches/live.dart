// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:newsports/controllers/MatchController.dart';

import '../../../widget/cardView.dart';

class LivePage extends StatefulWidget {
  MatchController controller;
  LivePage({required this.controller});
  @override
  _LivePageState createState() => _LivePageState(con: controller);
}

class _LivePageState extends StateMVC<LivePage> {

  late MatchController _con;
  final scrollController = ScrollController();

  _LivePageState({required MatchController con}):super(con){
    _con = controller as MatchController;
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }
  @override
  Future<bool> initAsync() async {
    await _con.initSport();
    _con.getMyLiveMatches(context);
    return super.initAsync();
  }


  @override
  Widget build(BuildContext context) {

    if(_con.myLiveMatchList.loading){
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_con.myLiveMatchList.error!=null){
      return Expanded(
        child: Center(
          child: Text(_con.myLiveMatchList.error!),
        ),
      );
    }
    if(_con.myLiveMatchList.value!.isEmpty) {
      return Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of(
                "You haven't joined any contests that are live"),
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
        ],
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: _con.myLiveMatchList.value!.length,
          itemBuilder: (c, index) {
            final match = _con.myLiveMatchList.value![index];
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
