class Bowlers {
  Bowlers({
      this.runsConceded = 0,
      this.maidens = 0,
      this.wickets = 0,
      this.bowlerId = 0,
      this.overs = 0,});

  Bowlers.fromJson(dynamic json) {
    runsConceded = json['runs_conceded'];
    maidens = json['maidens'];
    wickets = json['wickets'];
    bowlerId = json['bowler_id'];
    overs = json['overs'];
  }
  int runsConceded = 0;
  int maidens = 0;
  int wickets = 0;
  int bowlerId = 0;
  double overs = 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['runs_conceded'] = runsConceded;
    map['maidens'] = maidens;
    map['wickets'] = wickets;
    map['bowler_id'] = bowlerId;
    map['overs'] = overs;
    return map;
  }

}