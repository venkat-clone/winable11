class Batsmen {
  Batsmen({
      this.name = "", 
      this.batsmanId = "", 
      this.batting = "", 
      this.position = "", 
      this.role = "", 
      this.roleStr = "", 
      this.runs = "", 
      this.ballsFaced = "", 
      this.fours = "", 
      this.sixes = "", 
      this.run0 = "", 
      this.run1 = "", 
      this.run2 = "", 
      this.run3 = "", 
      this.run5 = "", 
      this.howOut = "", 
      this.dismissal = "", 
      this.strikeRate = "", 
      this.bowlerId = "", 
      this.firstFielderId = "", 
      this.secondFielderId = "", 
      this.thirdFielderId = ""});

  Batsmen.fromJson(dynamic json) {
    name = json['name']??"";
    batsmanId = json['batsman_id']??"";
    batting = json['batting']??"";
    position = json['position']??"";
    role = json['role']??"";
    roleStr = json['role_str']??"";
    runs = json['runs']??"";
    ballsFaced = json['balls_faced']??"";
    fours = json['fours']??"";
    sixes = json['sixes']??"";
    run0 = json['run0']??"";
    run1 = json['run1']??"";
    run2 = json['run2']??"";
    run3 = json['run3']??"";
    run5 = json['run5']??"";
    howOut = json['how_out']??"";
    dismissal = json['dismissal']??"";
    strikeRate = json['strike_rate']??"";
    bowlerId = json['bowler_id']??"";
    firstFielderId = json['first_fielder_id']??"";
    secondFielderId = json['second_fielder_id']??"";
    thirdFielderId = json['third_fielder_id']??"";
  }
  String name = "";
  String batsmanId = "";
  String batting = "";
  String position = "";
  String role = "";
  String roleStr = "";
  String runs = "";
  String ballsFaced = "";
  String fours = "";
  String sixes = "";
  String run0 = "";
  String run1 = "";
  String run2 = "";
  String run3 = "";
  String run5 = "";
  String howOut = "";
  String dismissal = "";
  String strikeRate = "";
  String bowlerId = "";
  String firstFielderId = "";
  String secondFielderId = "";
  String thirdFielderId = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['batsman_id'] = batsmanId;
    map['batting'] = batting;
    map['position'] = position;
    map['role'] = role;
    map['role_str'] = roleStr;
    map['runs'] = runs;
    map['balls_faced'] = ballsFaced;
    map['fours'] = fours;
    map['sixes'] = sixes;
    map['run0'] = run0;
    map['run1'] = run1;
    map['run2'] = run2;
    map['run3'] = run3;
    map['run5'] = run5;
    map['how_out'] = howOut;
    map['dismissal'] = dismissal;
    map['strike_rate'] = strikeRate;
    map['bowler_id'] = bowlerId;
    map['first_fielder_id'] = firstFielderId;
    map['second_fielder_id'] = secondFielderId;
    map['third_fielder_id'] = thirdFielderId;
    return map;
  }

}