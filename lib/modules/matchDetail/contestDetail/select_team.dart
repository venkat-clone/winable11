import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../controllers/TeamController.dart';
import '../../../models/MatchModel.dart';
import '../../../models/team_players.dart';
import '../myTeam.dart';

class SelectTeam extends StatefulWidget {

  Function(TeamPlayers) saveTeam;
  String matchId;
  final MatchModel match;

  SelectTeam({Key? key,
    required this.saveTeam,
    required this.matchId,
    required this.match,
  }) : super(key: key);

  @override
  StateMVC<SelectTeam> createState() => _SelectTeamState();
}

class _SelectTeamState extends StateMVC<SelectTeam> {
  late TeamController _con ;

  _SelectTeamState():super(TeamController()){
    _con = controller as TeamController;
  }
  TeamPlayers? slected ;


  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Future<bool> initAsync()  async{
    await _con.getSport();
    await _con.getMyTeam(widget.match);
    return super.initAsync();
  }

  @override
  Widget build(BuildContext context) {

    // if(_con.myTeams.loading) return Center(
    //   child: CircularProgressIndicator(),
    // );
    // if(_con.myTeams.value!.isEmpty){
    //   return Center(
    //     child: Text("No Contest for this Match",style: TextStyle(
    //         color: Colors.grey
    //     ),),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Team"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
  
      floatingActionButton: InkWell(
        onTap: (){
          if(slected==null) return;
          widget.saveTeam(slected!);
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: 40,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: slected!=null?Colors.green:Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Text("Select Team",style: Theme.of(context).textTheme.button!.copyWith(
            color: slected!=null?Colors.white:Colors.black45,
            fontWeight: FontWeight.bold,
          ),)),
        ),
      ),
      body: _con.myTeams.loading? Center(
        child: CircularProgressIndicator(),
      ) : _con.myTeams.value!.isEmpty ? Center(
        child: Text("No Contest for this Match",style: TextStyle(
            color: Colors.grey
        ),),
      ): Container(
        child: ListView(
          children: [
            ..._con.myTeams.value!.map((e) {
              return Wrap(
                children: [
                  Radio(
                      activeColor: Colors.black,
                      value: e, groupValue: slected, onChanged: (c){
                    setState(() {
                      slected = e;
                    });


                  }),
                  MyTeamCard(team: e,sport: _con.sport,match:widget.match),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
