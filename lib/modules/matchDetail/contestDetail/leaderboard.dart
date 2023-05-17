// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/base_classes/value_state.dart';
import 'package:newsports/constance/constance.dart';
import 'package:flutter/material.dart';

import '../../../models/ContestParticipants.dart';
import '../../../models/MatchModel.dart';
import '../../../models/UserRank.dart';
import '../../createTeam/teamPreview.dart';

class LeaderboardPage extends StatefulWidget {
  ValueState<List<UserRank>> contestTeam;
  MatchModel match;
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();

  LeaderboardPage({required this.contestTeam,required this.match,});
}

class _LeaderboardPageState extends State<LeaderboardPage> {




  @override
  Widget build(BuildContext context) {


    if(widget.contestTeam.loading)
      return Expanded(child: Center(
      child: CircularProgressIndicator(),
    ));
    if(widget.contestTeam.error!=null)
      return Expanded(child: Center(
      child: Text(widget.contestTeam.error??''),
    ));
    if(widget.contestTeam.value==null)
      return Expanded(child: Center(
      child: Text('no one joined this contest be first to join the contest'),
    ));



    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(
                      'Be the first in  your network to join this contest.'),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        AppLocalizations.of('All Teams (${widget.contestTeam.value!.length})'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black87,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                      AppLocalizations.of('Points'),
                        textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                    ),),
                    Expanded(
                      flex: 1,
                      child: Text(
                      AppLocalizations.of('Rank'),
                        textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 6,
              ),
              if(widget.contestTeam.value!.length==0)
                Center(child: Text("Be first to join the contest"),),
              ...widget.contestTeam.value!.map((e) {
                ImageProvider img = AssetImage(ConstanceData.palyerProfilePic);
                if(e.image!=""){ img = NetworkImage(e.image);}
                 return row(e, img);
                  }),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget row(UserRank user, ImageProvider image) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (c)=>TeamPreViewPage(
          team1: widget.match.team1,
          team2: widget.match.team2,
          team: user.teamPlayers!,
        )));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: image,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.black87,
                                letterSpacing: 0.6,
                                fontSize: 14,
                              ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'joined with team \n'+user.teamName,
                            softWrap: true,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              // color: Colors.black87,
                              letterSpacing: 0.6,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded( flex:1,child: Text(user.points,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black87,
                letterSpacing: 0.6,
                fontSize: 14,
              ),
            )),
            Expanded( flex:1,
                child: Text('#'+user.rank,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black87,
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
