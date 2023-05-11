

import 'package:newsports/models/userTeamPlayer.dart';

import '../utils/designations.dart';


class Player{

  String pid = "";
  String id = "";
  String name = "";
  /// Check out this [Designation] or ../utils/designations.dart
  String designationId = "";
  String teamId = "";
  String playingStatus = "";
  String creditPoints = "0";
  String points = "0";
  String image = "";
  String dob = "";
  String nationality = "";
  String bowls = "";
  String bats = "";
  String createdDate = "";
  String modifiedDate = "";

  /// is_substitute ==0 && player is not substitute
  /// is_substitute ==1 && player is substitute
  bool substitute = false;
  /// same as substitute
  bool announced = false;


  Designation getDesignation(String sport) =>Designation.getDesignation(sport, int.parse(designationId));

  Player({

    this.pid="",
    this.name="",
    this.designationId="",
    this.teamId="",
    this.playingStatus="",
    this.creditPoints="0",
    this.points="0",
    this.image="",
    this.dob="",
    this.nationality="",
    this.bowls="",
    this.bats="",
    this.createdDate="",
    this.modifiedDate=""
  });

  Player.fromJson(Map<String,dynamic> json){

    pid = json['pid']??"";
    pid = json['id']??"";
    name = json['name']??"";
    designationId = json['designationid']??"";
    teamId = json['team_id']??"";
    playingStatus = json['playing_status']??"";
    creditPoints = json['credit_points']??"0";
    points = json['points']??"0";
    image = json['image']??"";
    dob = json['dob']??"";
    nationality = json['nationality']??"";
    bowls = json['bowls']??"";
    bats = json['bats']??"";
    createdDate = json['created_date']??"";
    modifiedDate = json['modified_date']??"";
    announced = (json['is_select']??'0')=='1';
    substitute = (json['is_substitute']??'0')=='1';
  }

  Player.fromFootball(Map<String,dynamic> json){
    pid = json['pid']??"";
    name = json['name']??"";
    designationId = getFootballDesignationId(json['designationid']??"");
    teamId = json['team_id']??"";
    playingStatus = json['playing_status']??"";
    creditPoints = json['credit_points']??"0";
    points = json['points']??"0";
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
