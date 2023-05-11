

class Designation{
  String fullName;
  String shortName;

  static String cricket = 'Cricket';
  static String football = 'FootBall';

  Designation({
    required this.fullName,
    required this.shortName,
  });
  /// for Cricket
  /// 1 = Batsman = GoalKeeper \n
  /// 2 = Bowler = Defender \n
  /// 3 = All Rounder = Midfielder \n
  /// 4 = Wicket Keeper = Forward \n
  static Designation getDesignation(String sport,int designationId){
    if(sport==cricket){
      return cricketDesignation[designationId];
    }
    if(sport==football){
      return footBallDesignation[designationId];
    }
    return cricketDesignation[0];
  }

  /// for Cricket
  /// 1 = Batsman
  /// 2 = Bowler
  /// 3 = All Rounder
  /// 4 = Wicket Keeper
  static List<Designation> cricketDesignation = [
    Designation(fullName: "", shortName: ""),/// Ignore no designation
    Designation(fullName: "Batsman", shortName: "BAT"),
    Designation(fullName: "Bowler", shortName: "BOWL"),
    Designation(fullName: "All Rounder", shortName: "AR"),
    Designation(fullName: "Wicket Keeper", shortName: "WK"),
  ];

  /// for Football
  /// 1 = GoalKeeper
  /// 2 = Defender
  /// 3 = Midfielder
  /// 4 = Forward
  static List<Designation> footBallDesignation = [
    Designation(fullName: "", shortName: ""),/// Ignore no designation
    Designation(fullName: "GoalKeeper", shortName: "GK"),
    Designation(fullName: "Defender", shortName: "DEF"),
    Designation(fullName: "Midfielder", shortName: "MID"),
    Designation(fullName: "Forward", shortName: "ST"),
  ];


}