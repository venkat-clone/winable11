import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/models/MatchModel.dart';

import '../../../Language/appLocalizations.dart';
import '../../../controllers/FeedController.dart';
import '../../../widget/timeLeft.dart';

class Commentary extends StatefulWidget {
  MatchModel match;
  Commentary({Key? key,required this.match}) : super(key: key);

  @override
  StateMVC<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends StateMVC<Commentary> {

  late FeedController _con ;
  _CommentaryState():super(FeedController()){
    _con = controller as FeedController;
  }
  final selectedIndex = 0;
  
  final List<String> tabList =["1st Innings","2st Innings","Players"];



  @override
  void initState() {
    initAsync();
    super.initState();
  }
  @override
  Future<bool> initAsync() {
    _con.getMatchCommentary(context,widget.match.matchId,inning: "1");
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("${widget.match.team1.teamShortName} vs ${widget.match.team1.teamShortName}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
      //     color: Theme.of(context).colorScheme.onPrimary
      //   ),),
      //   centerTitle: true,
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: Column(
        children: [
          appBar(),
        ],
      ),
    );
  }


  Widget appBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).dividerColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).textTheme.headline6!.color,
                            size: 24,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "${widget.match.team1.teamShortName} vs ${widget.match.team1.teamShortName}",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        SizedBox(width: 24,)
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              margin: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              child: Image.network(
                                widget.match.team1.teamImage,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Text(
                              widget.match.team1.teamName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.match.team1Score,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  widget.match.team1Over,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              margin: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              child: Image.network(
                                widget.match.team2.teamImage,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Text(
                              widget.match.team2.teamName,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                letterSpacing: 0.6,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.match.team2Score,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "(${widget.match.team2Over})",
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                    ],
                  ),
                  ListView(
                    children: [
                      ..._con.inning1Commentary.value!.commentaries!.map((e) =>Container(
                child: Row(
                  children: [
                    Text(e.over),
                    Text(e.commentary),
                  ],
                ),
            )),
                    ],
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}

