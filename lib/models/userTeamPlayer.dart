
import 'package:newsports/models/player.dart';

class UserTeamPlayer extends Player{

  UserTeamPlayer({
    this.teamShortName ="",
    name ="",
    designationId ="",
  });
  String teamImage="";
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
    pid = json['pid']??json['playerid']??"";
    id = json['id'].toString()??"";
    name = json['name']??"";
    designationId = json['designationid']??"";
    teamId = json['teamid']??"";
    playingStatus = json['playing_status'].toString()??"";
    creditPoints = json['credit_points']??"0";
    points = json['points']??"0";
    image = json['image']??"";
    dob = json['dob']??"";
    nationality = json['nationality']??"";
    bowls = json['bowls']??"";
    bats = json['bats']??"";
    createdDate = json['created_date']??"";
    modifiedDate = json['modified_date']??"";
    substitute = (json['is_substitute']??'0')=='1';
  }

  UserTeamPlayer.fromFootball(Map<String,dynamic> json){

    pid = json['pid']??"";
    id = json['id']??"";
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

  UserTeamPlayer.fromJsonUpload(Map<String,dynamic> json){
    name = json["player"];
    pid = json["player_id"];
    designationId = json["designation_id"];
  }
  UserTeamPlayer.getFromJson(Map<String,dynamic> json){
    name = json["player"]??"";
    pid = json["player_id"]??"";
    designationId = json["designation_id"]??"";
    image = "https://admin.winable11.com/"+(json['image']??"");
  }

  getJsonUploadWithCaptain(
      bool isCaptain,
      bool isWiseCaptain,
      String teamId
      )=>{
    "player":name,
    "player_id":pid,
    "designation_id":designationId,
    "is_captian":isCaptain,
    "is_vicecaptain":isWiseCaptain,
    "team_id":teamId
  };



}