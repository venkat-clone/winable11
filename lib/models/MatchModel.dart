class MatchModel {
  MatchModel({
      this.matchId = "" ,
      this.uniqueId = "" ,
      this.competitionId = "",
      this.squad = "",
      this.tossWinnerTeam = "",
      this.winnerTeam = "",
      this.teamid1 = "",
      this.teamid2 = "",
      this.elevenOut = "",
      this.matchStatus = "",
      this.matchStarted = "",
      this.type = "",
      this.time = "",
      this.matchDateTime = "",
      this.title = "",
      this.refund = "",
      this.team1Score = "",
      this.team1Over = "",
      this.team2Score = "",
      this.team2Over = "",
      this.paymentStatus = "",
      this.matchStatusNote = "",
      this.createdDate = "",
      this.modifiedDate = "",
  });

  MatchModel.fromJson(dynamic json) {
    matchId = json['match_id']??"";
    uniqueId = json['unique_id']??"";
    competitionId = json['competition_id']??"";
    squad = json['squad']??"";
    tossWinnerTeam = json['toss_winner_team']??"";
    winnerTeam = json['winner_team']??"";
    teamid1 = json['teamid1']??"";
    teamid2 = json['teamid2']??"";
    elevenOut = json['eleven_out']??"";
    matchStatus = json['match_status']??"";
    matchStarted = json['matchStarted']??"";
    type = json['type']??"";
    time = json['time']??"";
    matchDateTime = json['match_date_time']??"";
    title = json['title']??"";
    refund = json['refund']??"";
    team1Score = json['team1Score']??"";
    team1Over = json['team1Over']??"";
    team2Score = json['team2Score']??"";
    team2Over = json['team2Over']??"";
    paymentStatus = json['payment_status']??"";
    matchStatusNote = json['match_status_note']??"";
    createdDate = json['created_date']??"";
    modifiedDate = json['modified_date']??"";
  }
  String matchId ="";
  String uniqueId ="";
  String competitionId ="";
  String squad ="";
  String tossWinnerTeam ="";
  String winnerTeam ="";
  String teamid1="";
  String teamid2 ="";
  String elevenOut ="";
  String matchStatus ="";
  String matchStarted ="";
  String type ="";
  String time ="";
  String matchDateTime ="";
  String title ="";
  String refund ="";
  String team1Score ="";
  String team1Over ="";
  String team2Score ="";
  String team2Over ="";
  String paymentStatus ="";
  String matchStatusNote ="";
  String createdDate ="";
  String modifiedDate ="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['match_id'] = matchId;
    map['unique_id'] = uniqueId;
    map['competition_id'] = competitionId;
    map['squad'] = squad;
    map['toss_winner_team'] = tossWinnerTeam;
    map['winner_team'] = winnerTeam;
    map['teamid1'] = teamid1;
    map['teamid2'] = teamid2;
    map['eleven_out'] = elevenOut;
    map['match_status'] = matchStatus;
    map['matchStarted'] = matchStarted;
    map['type'] = type;
    map['time'] = time;
    map['match_date_time'] = matchDateTime;
    map['title'] = title;
    map['refund'] = refund;
    map['team1Score'] = team1Score;
    map['team1Over'] = team1Over;
    map['team2Score'] = team2Score;
    map['team2Over'] = team2Over;
    map['payment_status'] = paymentStatus;
    map['match_status_note'] = matchStatusNote;
    map['created_date'] = createdDate;
    map['modified_date'] = modifiedDate;
    return map;
  }

}