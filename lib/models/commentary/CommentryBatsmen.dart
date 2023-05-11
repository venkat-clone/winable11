class Batsmen {
  Batsmen({
      this.runs ="",
      this.ballsFaced ="",
      this.fours ="",
      this.sixes ="",
      this.batsmanId ="",});

  Batsmen.fromJson(dynamic json) {
    runs = (json['runs']??"").toString();
    ballsFaced = (json['balls_faced']??"").toString();
    fours = (json['fours']??"").toString();
    sixes = (json['sixes']??"").toString();
    batsmanId = (json['batsman_id']??"").toString();
  }
  String runs ="";
  String ballsFaced ="";
  String fours ="";
  String sixes ="";
  String batsmanId ="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['runs'] = runs;
    map['balls_faced'] = ballsFaced;
    map['fours'] = fours;
    map['sixes'] = sixes;
    map['batsman_id'] = batsmanId;
    return map;
  }

}