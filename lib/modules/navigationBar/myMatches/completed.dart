import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/widget/cardView.dart';
import 'package:flutter/material.dart';

import '../../../controllers/MatchController.dart';

class CompletedPage extends StatefulWidget {
  MatchController controller;
  CompletedPage({required this.controller});

  @override
  _CompletedPageState createState() => _CompletedPageState(con: controller);
}

class _CompletedPageState extends StateMVC<CompletedPage> {
  late MatchController _con ;
  final scrollController  = ScrollController();
  _CompletedPageState({required MatchController con}):super(con){
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
    _con.getMyPastMatches(context);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {
    if(_con.myPastMatchList.loading){
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_con.myPastMatchList.error!=null){
      return Expanded(
        child: Center(
          child: Text(_con.myPastMatchList.error!),
        ),
      );
    }
    if(_con.myPastMatchList.value!.isEmpty) {
      return Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(

            AppLocalizations.of(
                "You haven't joined any contests that are completed"),
            textAlign: TextAlign.center,
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
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Card(
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
          itemCount: _con.myPastMatchList.value!.length,
          itemBuilder: (c,index){
            final match = _con.myPastMatchList.value![index];

            return CompleteCardView(
              match: match,
            );

            return CardView(
              match: match,
            );
          }, separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 15,),
        ),
      ),
    );
  }
}
