class Bowlers {
  Bowlers({
      this.runsConceded = "",
      this.maidens = "",
      this.wickets = "",
      this.bowlerId = "",
      this.overs = "",});

  Bowlers.fromJson(dynamic json) {
    runsConceded = (json['runs_conceded']??"").toString();
    maidens = (json['maidens']??"").toString();
    wickets = (json['wickets']??"").toString();
    bowlerId = (json['bowler_id']??"").toString();
    overs = (json['overs']??"").toString();
  }
  String runsConceded = "";
  String maidens = "";
  String wickets = "";
  String bowlerId = "";
  String overs = "";

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