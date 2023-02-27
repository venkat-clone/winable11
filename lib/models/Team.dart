class Team {
  Team({
      this.teamId="",
      this.uniqueId="",
      this.teamName="",
      this.teamShortName="",
      this.teamImage="",
      this.modifiedDate="",});

  Team.fromJson(dynamic json) {
    teamId = json['team_id']??"";
    uniqueId = json['unique_id']??"";
    teamName = json['team_name']??"";
    teamShortName = json['team_short_name']??"";
    teamImage = json['team_image']??"";
    modifiedDate = json['modified_date']??"";
  }
  String teamId = "";
  String uniqueId = "";
  String teamName = "";
  String teamShortName = "";
  String teamImage = "";
  String modifiedDate = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['team_id'] = teamId;
    map['unique_id'] = uniqueId;
    map['team_name'] = teamName;
    map['team_short_name'] = teamShortName;
    map['team_image'] = teamImage;
    map['modified_date'] = modifiedDate;
    return map;
  }

}