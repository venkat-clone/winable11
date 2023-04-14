class Bowlers {
  Bowlers({
      this.name = "",
      this.bowlerId = "",
      this.bowling = "",
      this.position = "",
      this.overs = "",
      this.maidens = "",
      this.runsConceded = "",
      this.wickets = "",
      this.noballs = "",
      this.wides = "",
      this.econ = "",
      this.run0 = "",
      this.bowledcount = "",
      this.lbwcount = "",});

  Bowlers.fromJson(dynamic json) {
    name = json['name']??"";
    bowlerId = json['bowler_id']??"";
    bowling = json['bowling']??"";
    position = json['position']??"";
    overs = json['overs']??"";
    maidens = json['maidens']??"";
    runsConceded = json['runs_conceded']??"";
    wickets = json['wickets']??"";
    noballs = json['noballs']??"";
    wides = json['wides']??"";
    econ = json['econ']??"";
    run0 = json['run0']??"";
    bowledcount = json['bowledcount']??"";
    lbwcount = json['lbwcount']??"";
  }
  String name = "";
  String bowlerId = "";
  String bowling = "";
  String position = "";
  String overs = "";
  String maidens = "";
  String runsConceded = "";
  String wickets = "";
  String noballs = "";
  String wides = "";
  String econ = "";
  String run0 = "";
  String bowledcount = "";
  String lbwcount = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['bowler_id'] = bowlerId;
    map['bowling'] = bowling;
    map['position'] = position;
    map['overs'] = overs;
    map['maidens'] = maidens;
    map['runs_conceded'] = runsConceded;
    map['wickets'] = wickets;
    map['noballs'] = noballs;
    map['wides'] = wides;
    map['econ'] = econ;
    map['run0'] = run0;
    map['bowledcount'] = bowledcount;
    map['lbwcount'] = lbwcount;
    return map;
  }

}