
import 'package:newsports/models/winnersData.dart';

class Contest{
  String contestId = "";
  String contestName = "";
  String contestTag = "";
  String winners = "";
  String prizePool = "";
  String totalTeam = "0";
  String joinTeam = "0";
  String entry = "";
  String contestDescription = "";
  String contestNote1 = "";
  String contestNote2 = "";
  String winningNote = "";
  String matchId = "";
  String type = "";
  String filledSpots ='0';
  List<WinnersData> winnersData = [];

  toJson()=>{
    'contest_id':contestId,
    'contest_name':contestName,
    'contest_tag':contestTag,
    'winners':winners,
    'prize_pool':prizePool,
    'total_team':totalTeam,
    'join_team':joinTeam,
    'entry':entry,
    'contest_description':contestDescription,
    'contest_note1':contestNote1,
    'contest_note2':contestNote2,
    'winning_note':winningNote,
    'match_id':matchId,
    'type':type,
  };

  Contest({
    this.contestId = "", this.contestName = "", this.contestTag = "", this.winners = "",
    this.prizePool = "", this.totalTeam = "0", this.joinTeam = "", this.entry = "",
    this.contestDescription = "", this.contestNote1 = "", this.contestNote2 = "",
    this.winningNote = "", this.matchId = "", this.type = "",
  });



  Contest.fromJson(Map<String,dynamic> json){
    contestId = json['contest_id']??"";
    contestName = json['contest_name']??"";
    contestTag = json['contest_tag']??"";
    winners = json['winners']??"";
    prizePool = json['prize_pool']??"";
    totalTeam = json['total_team']??"0";
    joinTeam = json['join_team']??"0";
    entry = json['entry']??"";
    contestDescription = json['contest_description']??"";
    contestNote1 = json['contest_note1']??"";
    contestNote2 = json['contest_note2']??"";
    winningNote = json['winning_note']??"";
    matchId = json['match_id']??"";
    type = json['type']??"0";
    filledSpots = json['filled_spots']??'0';
    winnersData =[];
    (json['winners_data']??[]).forEach((element) {
      winnersData.add(WinnersData.fromJson(element));
    });
  }


  Contest.fromJsonWith(Map<String,dynamic> json,String match_Id){
    contestId = json['contest_id']??"";
    contestName = json['contest_name']??"";
    contestTag = json['contest_tag']??"";
    winners = json['winners']??"";
    prizePool = json['prize_pool']??"";
    totalTeam = json['total_team']??"0";
    joinTeam = json['join_team']??"0";
    entry = json['entry']??"";
    contestDescription = json['contest_description']??"";
    contestNote1 = json['contest_note1']??"";
    contestNote2 = json['contest_note2']??"";
    winningNote = json['winning_note']??"";
    matchId = match_Id;
    type = json['type']??"0";
    filledSpots = json['filled_spots']??'0';
    winnersData =[];
    (json['winners_data']??[]).forEach((element) {
      winnersData.add(WinnersData.fromJson(element));
    });
  }

}