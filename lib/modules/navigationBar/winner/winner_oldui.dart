
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:newsports/controllers/MatchController.dart';
import 'package:newsports/utils/utils.dart';

import '../../../controllers/winnerController.dart';
import '../../../widget/cardView.dart';

class OlDWinnerPage extends StatefulWidget {
  @override
  _OlDWinnerPageState createState() => _OlDWinnerPageState();
}

class _OlDWinnerPageState extends StateMVC<OlDWinnerPage> {


  late MatchController _con;

  _OlDWinnerPageState():super(MatchController()){
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
    await _con.getMyPastMatches(context);
    return super.initAsync();
  }
  final scrollController  = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.color,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            AppLocalizations.of('Winners'),
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
              size: 22,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
        body: _con.myPastMatchList.loading ?
        Center(child: CircularProgressIndicator()) :

        ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of('Mega Contest Winners'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            AppLocalizations.of('Filter by Tour'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black87,
                              letterSpacing: 0.6,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.sort,
                            color: Colors.black87,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ...?_con.myPastMatchList.value?.map((element) {
                        final match = element;
                        final teamA = match.team1;
                        final teamB = match.team2;
                        Text("data");
                        return Column(
                          children: [
                            FeedCardView(
                              match: match,
                            ),
                            SizedBox(height: 10,)
                          ],
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ),
              ],
            ),

    );
  }

  Widget cardView(String txt1, String txt2, String txt3, AssetImage image) {
    return Card(
      elevation: 5,
      child: Container(
        height: 140,
        width: 120,
        color: Theme.of(context).appBarTheme.color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                txt1,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                txt2,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  letterSpacing: 0.6,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                  radius: 34,
                  backgroundColor: Theme.of(context).textTheme.headline6!.color,
                  backgroundImage: image),
            ),
            Expanded(child: SizedBox()),
            Container(
              color: Theme.of(context).primaryColor,
              height: 20,
              child: Center(
                child: Text(
                  txt3,
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
    );
  }
}