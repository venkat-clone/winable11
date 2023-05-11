class Fielder {
  Fielder({
      this.fielderId  ="",
      this.fielderName  ="",
      this.catches  =0,
      this.runoutThrower  = 0,
      this.runoutCatcher  = 0,
      this.runoutDirectHit  = 0,
      this.stumping  = 0,
      this.isSubstitute  ="",});

  Fielder.fromJson(dynamic json) {
    fielderId = json['fielder_id'];
    fielderName = json['fielder_name'];
    catches = json['catches'];
    runoutThrower = json['runout_thrower'];
    runoutCatcher = json['runout_catcher'];
    runoutDirectHit = json['runout_direct_hit'];
    stumping = json['stumping'];
    isSubstitute = json['is_substitute'];
  }
  String fielderId ="";
  String fielderName ="";
  int catches =0;
  int runoutThrower = 0;
  int runoutCatcher = 0;
  int runoutDirectHit = 0;
  int stumping = 0;
  String isSubstitute ="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fielder_id'] = fielderId;
    map['fielder_name'] = fielderName;
    map['catches'] = catches;
    map['runout_thrower'] = runoutThrower;
    map['runout_catcher'] = runoutCatcher;
    map['runout_direct_hit'] = runoutDirectHit;
    map['stumping'] = stumping;
    map['is_substitute'] = isSubstitute;
    return map;
  }

}