// ignore_for_file: deprecated_member_use

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constance/constance.dart';
import '../../../controllers/MatchController.dart';
import '../../../widget/cardView.dart';
import '../../../widget/commentaryCard.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends StateMVC<FeedPage> {

  late MatchController _con;
  _FeedPageState() : super(MatchController()) {
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
    await _con.getMyLiveMatches(context);
    return super.initAsync();
  }
  
  
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20),
        //     child: Icon(
        //       Icons.search,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
      ),
      body: _con.myLiveCricketMatchList.value==null ? handleState() :_con.myLiveCricketMatchList.value!=null ?Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _con.myLiveMatchList.value!.length,
          itemBuilder: (c, index) {
            final match = _con.myLiveMatchList.value![index];
            return LiveSliderCardView(
              match: match,
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 15,
          ),
        ),
      ):Center(child: Text("no live matches"),),
    );
  }
  
  Widget handleState(){
    if(_con.myLiveMatchList.loading) return loading();
    else if(_con.myLiveMatchList.error!=null) return error();
    return SizedBox();
  }
  
  Widget loading()=>Center(
    child: CircularProgressIndicator(),
  );
  Widget error()=>Center(
    child: Center(child: Text(_con.myLiveMatchList.error!)),
  );

  
}
