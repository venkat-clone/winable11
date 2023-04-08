class Batsmen {
  Batsmen({
      this.runs =0,
      this.ballsFaced =0,
      this.fours =0,
      this.sixes =0,
      this.batsmanId =0,});

  Batsmen.fromJson(dynamic json) {
    runs = json['runs'];
    ballsFaced = json['balls_faced'];
    fours = json['fours'];
    sixes = json['sixes'];
    batsmanId = json['batsman_id'];
  }
  int runs =0;
  int ballsFaced =0;
  int fours =0;
  int sixes =0;
  int batsmanId =0;

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