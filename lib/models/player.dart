

import 'package:newsports/models/userTeamPlayer.dart';

import '../utils/designations.dart';


class Player{

  String id = "";
  String pid = "";
  String name = "";
  /// Check out this [Designation] or ../utils/designations.dart
  String designationId = "";
  String teamId = "";
  String playingStatus = "";
  String creditPoints = "";
  String points = "";
  String image = "";
  String dob = "";
  String nationality = "";
  String bowls = "";
  String bats = "";
  String createdDate = "";
  String modifiedDate = "";


  Designation getDesignation(String sport) =>Designation.getDesignation(sport, int.parse(designationId));

  Player({
    this.id="",
    this.pid="",
    this.name="",
    this.designationId="",
    this.teamId="",
    this.playingStatus="",
    this.creditPoints="",
    this.points="",
    this.image="",
    this.dob="",
    this.nationality="",
    this.bowls="",
    this.bats="",
    this.createdDate="",
    this.modifiedDate=""
  });

  Player.fromJson(Map<String,dynamic> json){
    id = json['id']??"";
    pid = json['pid']??"";
    name = json['name']??"";
    designationId = json['designationid']??"";
    teamId = json['team_id']??"";
    playingStatus = json['playing_status']??"";
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

  Player.fromFootball(Map<String,dynamic> json){
    id = json['id']??"";
    pid = json['pid']??"";
    name = json['name']??"";
    designationId = getFootballDesignationId(json['designationid']??"");
    teamId = json['team_id']??"";
    playingStatus = json['playing_status']??"";
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

  String getFootballDesignationId(String designation){
    switch(designation){
      case "Forward" :return "4";
      case "Midfielder" :return "3";
      case "Defender" :return "2";
      default :return "1";
    }
  }
  
  toJson()=>{
    'id':id,
    'pid':pid,
    'name':name,
    'designationid':designationId,
    'team_id':teamId,
    'playing_status':playingStatus,
    'credit_points':creditPoints,
    'points':points,
    'image':image,
    'dob':dob,
    'nationality':nationality,
    'bowls':bowls,
    'bats':bats,
    'created_date':createdDate,
    'modified_date':modifiedDate,
  };



}
