
class PlayerStats{
  String pid='';
  String name='';
  String teamId='';
  String teamShortName='';
  bool isSelected =false;
  bool isSubstitute = false;
  bool isCaptain = false;
  String designationId = '';
  String totalPoints = '0';
  PlayerStats.fromJson(Map<String,dynamic> json){
    pid = json['playerid']??'';
    name = json['name']??json['playerid']??'';
    teamId = json['teamid']??'';
    teamShortName = json['team_short_name']??'';
    isSelected = json['is_select']=='1';
    isSubstitute = json['is_substitute']=='1';
    isCaptain = json['is_captain']=='1';
    designationId = json['designationid']??'';
    totalPoints = json['total_points']??'0';
  }

}
