import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../controllers/TeamController.dart';
import '../../../models/team_players.dart';
import '../myTeam.dart';

class SelectTeam extends StatefulWidget {

  Function(TeamPlayers) saveTeam;
  String matchId;
  SelectTeam({Key? key,
    required this.saveTeam,
    required this.matchId,
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
    await _con.getMyTeam(widget.matchId);
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
      floatingActionButton: Container(

        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: (){
            if(slected==null) return;
            widget.saveTeam(slected!);
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: 40,
            color: slected!=null?Colors.green:Theme.of(context).disabledColor,
            child: Center(child: Text("Select Team",style: Theme.of(context).textTheme.button,)),
          ),
        ),
      ),
      body: _con.myTeams.loading? Center(
        child: CircularProgressIndicator(),
      ) : _con.myTeams.value!.isEmpty ? Center(
        child: Text("No Contest for this Match",style: TextStyle(
            color: Colors.grey
        ),),
      ): ListView(
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
                MyTeamCard(team: e,sport: _con.sport,),
              ],
            );
          }),
        ],
      ),
    );
  }
}
