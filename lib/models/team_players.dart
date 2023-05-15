


import 'package:newsports/models/player.dart';
import 'package:newsports/models/userTeamPlayer.dart';

class TeamPlayers{
  List<UserTeamPlayer> players =[];

  int teamACount =0;
  int teamBCount =0;
  bool newTeam = true;

  List<UserTeamPlayer> players1 =[];
  List<UserTeamPlayer> players2 =[];
  List<UserTeamPlayer> players3 =[];
  List<UserTeamPlayer> players4 =[];

  String teamId="";
  String teamName="";
  String captainId ="";
  String viceCaptainId ="";
  String userId ="";
  String matchId = "";





  TeamPlayers({
    this.userId = "",
    this.teamName = "",
    this.captainId = "",
    this.viceCaptainId = "",
    this.matchId ="",
    this.teamId ="",
    this.players = const [],
  }){
    if(players.isEmpty)
      this.players = [];
  }


  toJson()=>{
    "user_id": userId,
    "match_id": matchId,
    "captain": captainId,
    "vice_captain": viceCaptainId,
    
    "players": players.map((e) => e.getJsonUpload()).toList(),
  };

  TeamPlayers.fromJson(Map<String,dynamic> json){
    teamId = json["team_id"]??"";
    teamName = json["team_name"]??json["team_id"]??"";
    captainId = json["captain"]??"";
    viceCaptainId = json["vice_captain"]??"";
    players = [];
    (json["players"] as List<dynamic>).forEach((element) {
      players.add(UserTeamPlayer.getFromJson(element));
    });
    players1 = players.where((element) => element.designationId=='1').toList();
    players2 = players.where((element) => element.designationId=='2').toList();
    players3 = players.where((element) => element.designationId=='3').toList();
    players4 = players.where((element) => element.designationId=='4').toList();


  }


  UserTeamPlayer? _captain;
  get captainName{
    return captain.name;
  }
  UserTeamPlayer get captain{
    if(_captain!=null) return _captain!;

    final result = players.where((element) => element.pid==captainId).toList();
    if(result.isNotEmpty){
      _captain = result.first;
    }
    return _captain!;
  }

  UserTeamPlayer? _viseCaptain;
  get viceCaptainName{
    return viceCaptain.name;
  }
  UserTeamPlayer get viceCaptain{
    if(_viseCaptain!=null) return _viseCaptain!;
    final result = players.where((element) => element.pid==viceCaptainId).toList();
    if(result.isNotEmpty){
      _viseCaptain = result.first;
    }
    return _viseCaptain!;
  }

  fromTeamPlayers(Team){

  }



}