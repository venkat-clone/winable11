
class Contest{
  String contestId = "";
  String contestName = "";
  String contestTag = "";
  String winners = "";
  String prizePool = "";
  String totalTeam = "";
  String joinTeam = "";
  String entry = "";
  String contestDescription = "";
  String contestNote1 = "";
  String contestNote2 = "";
  String winningNote = "";
  String matchId = "";
  String type = "";

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
    this.prizePool = "", this.totalTeam = "", this.joinTeam = "", this.entry = "",
    this.contestDescription = "", this.contestNote1 = "", this.contestNote2 = "",
    this.winningNote = "", this.matchId = "", this.type = ""
  });

  static fromJson(Map<String,dynamic> json)
  => Contest(
        contestId:json['contest_id']??"",
        contestName:json['contest_name']??"",
        contestTag:json['contest_tag']??"",
        winners:json['winners']??"",
        prizePool:json['prize_pool']??"",
        totalTeam:json['total_team']??"",
        joinTeam:json['join_team']??"",
        entry:json['entry']??"",
        contestDescription:json['contest_description']??"",
        contestNote1:json['contest_note1']??"",
        contestNote2:json['contest_note2']??"",
        winningNote:json['winning_note']??"",
        matchId:json['match_id']??"",
        type:json['type']??"",
      );

}