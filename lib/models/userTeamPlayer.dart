
import 'package:newsports/models/player.dart';

class UserTeamPlayer extends Player{

  UserTeamPlayer();
  String teamShortName = "";
  /// player selected to team
  bool selected = false;

  String get shortDesignation {
    switch(designationId){
      case "1":
        return "BAT";
      case "2":
        return "BOWL";
      case "3":
        return "AR";
      case "4":
        return "WK";
    }
    return "";
  }


  UserTeamPlayer.fromJson(Map<String,dynamic> json){
    id = json['id']??"";
    pid = json['pid']??"";
    name = json['name']??"";
    designationId = json['designationid']??"";
    teamId = json['team_id']??"";
    playingStatus = json['playing_status'].toString()??"";
    creditPoints = json['credit_points']??"";
    points = json['points']??"";
    image = json['image']??"";
    dob = json['dob']??"";
    nationality = json['nationality']??"";
    bowls = json['bowls']??"";
    bats = json['bats']??"";
    createdDate = json['created_date']??"";
    modifiedDate = json['modified_date']??"";
  }

  UserTeamPlayer.fromFootball(Map<String,dynamic> json){
    id = json['id']??"";
    pid = json['pid']??"";
    name = json['name']??"";
    designationId = getFootballDesignationId(json['designationid']??"");
    teamId = json['team_id']??"";
    playingStatus = json['playing_status'].toString()??"";
    creditPoints = json['credit_points']??"";
    points = json['points']??"";
    image = json['image']??"";
    dob = json['dob']??"";
    nationality = json['nationality']??"";
    bowls = json['bowls']??"";
    bats = json['bats']??"";
    createdDate = json['created_date']??"";
    modifiedDate = json['modified_date']??"";
  }

  getJsonUpload()=>{
    "player":name,
    "player_id":pid,
    "designation_id":designationId
  };



}